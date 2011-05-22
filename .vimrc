"Now vim plugins can go in their own directories under ~/.vim/bundle/"
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on
filetype indent on
syntax on

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

set shortmess=atI

set guioptions=a
set scrolloff=10

set history=1000

"Make file/command completion complete like the shell"
set wildmenu

let g:lisp_rainbow=1
let g:paredit_shortmaps=1

