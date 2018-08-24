set nocompatible	"Don't worry about compatibility with vi
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#begin()

" Vundle Bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kovisoft/slimv'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/yajs.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'rdnetto/YCM-Generator'
Plugin 'fatih/vim-go'
Plugin 'google/vim-jsonnet'

call vundle#end()

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
"set autoindent

set textwidth=80

" Open new splits to the right or below the others
set splitbelow
set splitright

set shortmess=atI	"Message abreviations
"set scrolloff=10   "Keep n lines around cursor. Nice for being able to scroll
"past the end of the file but bad because when you click into the buffer then
"it shifts the contents to keep n lines between the cursor and the edges of
"the window.  However you can still scroll with the mouse past the EOF
set history=1000
set wildmenu 		"Enhanced command line completion
set ruler		"Show line and column number of cursor
set number		"Show line numbers

"Next 3 required for powerline
"set laststatus=2	"Always show statusline
set encoding=utf-8	"Show unicode glyphs

colorscheme jellybeans
set t_Co=256

" Slimv options
let g:lisp_rainbow=0

"Write with sudo
cmap w!! %!sudo tee > /dev/null %

" Active directory is always the one where the active buffer is located
set autochdir

" Disable folding in vim-markdown
let g:vim_markdown_folding_disabled = 1

" Easier split navigation
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


" Highlight trailing whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Highlight doxygen comments in .c and .h files
autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen

" Spellcheck git commits
autocmd FileType gitcommit setlocal spell

" Show 80 column limit
set colorcolumn=79

" Automatically write files when running commands like make
set autowrite

" Go commands
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Toggle visibility of NerdTree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Set NerdTree to open path of current buffer
let NERDTreeChDirMode=2

" jsonnet specific config
au FileType jsonnet setl sw=2 sts=2 et

" yaml specific config
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
