set colorcolumn=80

set nocompatible
set noswapfile
set nobackup
set nowritebackup

set scrolloff=3
set shiftround
set showmode
set wildmenu
set wildmode=longest,list,full

set backspace=indent,eol,start

set nu
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set cursorline
set cursorcolumn
set list
set incsearch
set hlsearch
set ignorecase
set smartcase

autocmd BufRead,BufNewFile *.go set wm=2 tw=120

syntax on


call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

