" Modeline and Notes {
"  _____                          _             ______           _
" |  __ \                        (_)           |  ____|         | |
" | |__) |___  ___ _   _ _ __ ___ ___   _____  | |__ _   _ _ __ | | __
" |  _  // _ \/ __| | | | '__/ __| \ \ / / _ \ |  __| | | | '_ \| |/ /
" | | \ \  __/ (__| |_| | |  \__ \ |\ V /  __/ | |  | |_| | | | |   <
" |_|  \_\___|\___|\__,_|_|  |___/_| \_/ \___| |_|   \__,_|_| |_|_|\_\
"
"
"               I Believe In You.
"
"
"
"   This is the personal .vimrc file of Johnny Austin.
"
"   Find me at https://recursivefunk.io/
"
"   Copyright 2020 Johnny Austin
"
"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.
" }

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" JSX
Plugin 'mxw/vim-jsx'

Plugin 'Yggdroot/indentLine'

" Nerd Tree
Plugin 'scrooloose/nerdtree'

" es6 JavaScript
Plugin 'isRuslan/vim-es6'

" Need dat autoclose
Plugin 'townk/vim-autoclose'

" Indent lines
Plugin 'nathanaelkane/vim-indent-guides'

" HTML tags auto close
Plugin 'vim-scripts/HTML-AutoCloseTag'

" JSDoc
Plugin 'joegesualdo/jsdoc.vim'

" Prettier
Plugin 'mitermayer/vim-prettier'

" Typescript
Plugin 'leafgarland/typescript-vim'

" Vuejs Component Files
Plugin 'posva/vim-vue'

" Filetype icons
Plugin 'ryanoasis/vim-devicons'

Plugin 'dense-analysis/ale'
call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

set autoindent
set autoread                                          " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                       " Fix broken backspace in some setups
set backupcopy=yes                                    " see :help crontab
set clipboard=unnamed                                 " yank and paste with the system clipboard
set directory-=.                                      " don't store swapfiles in the current directory
set encoding=UTF-8
set nowrap
set expandtab
set history=100                                       " remember more than 20 cmd-history
set ignorecase                                        " case-insensitive search
set incsearch                                         " search as you type
set laststatus=2                                      " always show statusline
set list                                              " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set nobackup                                          " don't generate swap and backup files
set nowb
set number
set ruler                                             " show where you are
set scrolloff=3                                       " show context above/below cursorline
set shiftwidth=4
set showcmd
set smartcase                                         " case-sensitive search if any caps
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=79
set colorcolumn=80
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shell=$SHELL

" Enable JSX for .js files
let g:jsx_ext_require=0

" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']

let g:ale_sign_column_always = 1


" When invoked, unless a starting directory is specified, CtrlP will set its
" local working directory according to this variable:
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is
"       not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" Exclude these from fuzzy search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux

" Highlight the current line and column
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white

"Indentation guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 2 spaces for javascript/typescript
autocmd Filetype javascript,typescript,yaml,html,vue setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd FileType css,go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
" set vim working directory to the current file's directory
autocmd BufEnter * lcd %:p:h

filetype plugin indent on

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }

if (has("termguicolors"))
  "set termguicolors
endif
