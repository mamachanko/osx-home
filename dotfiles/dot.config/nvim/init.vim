call plug#begin()
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/joshdick/onedark.vim'
call plug#end()

set colorcolumn=80

set noswapfile
set nobackup
set nowritebackup

set shiftround
set showmode
set wildmenu
set wildmode=longest,list,full

set backspace=indent,eol,start

set number
set relativenumber

set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ruler
set cursorline
set cursorcolumn

set list

set hlsearch
set ignorecase
set smartcase
set infercase

colorscheme onedark

autocmd BufRead,BufNewFile *.go set wm=2 tw=120

syntax on

