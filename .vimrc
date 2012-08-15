"Now vim plugins can go in their own directories under ~/.vim/bundle/"
call pathogen#infect()

set autoread 	"Auto reloads changes

syntax on
filetype plugin indent on

set hlsearch 	"Highlights search terms
set incsearch	"Starts searching as characters are typed
set ignorecase	"Ignore case when searching
set smartcase	"Modifies ignore case to only ignore when the search pattern only has lowercase letters

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

set shortmess=atI	"Message abreviations
set scrolloff=10
set history=1000
set wildmenu 		"Enhanced command line completion
set ruler		"Show line and column number of cursor
set number		"Show line numbers
set nowrap		"Do not wrap lines

"Next 3 required for powerline
set nocompatible	"Don't worry about compatibility with vi
set laststatus=2	"Always show statusline
set encoding=utf-8	"Show unicode glyphs

colorscheme jellybeans
set t_Co=256

" Slimv options
let g:lisp_rainbow=1

" Powerline Options
let g:Powerline_symbols = 'unicode'
