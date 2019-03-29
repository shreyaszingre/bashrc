" Vim Configuration file
set nocompatible
set number
set ruler
set showcmd
set incsearch
set laststatus=2
set confirm
set cmdheight=2
set splitbelow
set splitright
set wildmenu
set hlsearch
set ignorecase
set smartcase
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set splitbelow
set splitright
syntax on
filetype indent plugin on
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
map Y yy
map ; :
inoremap jj <ESC>
