" Install plugins. {{
call plug#begin()

" Better defaults for commong Vim settings.
Plug 'tpope/vim-sensible'

" A colorscheme
Plug 'joshdick/onedark.vim'

" A nicer statusline.
Plug 'vim-airline/vim-airline'

" Write better shell scripts with shellcheck
" See: https://github.com/koalaman/shellcheck
Plug 'itspriddle/vim-shellcheck'

" Surround things
Plug 'tpope/vim-surround'

" Fzf for fuzzy finding files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ytt / Carvel / Starlark
Plug 'cappyzawa/starlark.vim'
Plug 'vmware-tanzu/ytt.vim'

call plug#end()
" }}

" Draw a visible column to see when lines get long.
set colorcolumn=80

" Don't maintain any backup or swapfiles.
set noswapfile
set nobackup
set nowritebackup

" Configure tab-complete menu behaviour to be like ZSH.
set shiftround
set wildmenu
set wildmode=longest,list,full

set backspace=indent,eol,start

" Show line numbers.
set number

" Configure identation.
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show horizontal and vertical visual aides.
set ruler
set cursorline
set cursorcolumn

" Show whitespace characters.
set list
" set listchars=tab:> ,trail:-,nbsp:+space:·
set showbreak=↪\ 
set listchars=tab:\ ,eol:,nbsp:␣,trail:⊙,extends:⟩,precedes:⟨

" Highlight search matches as you type the pattern.
set hlsearch
set incsearch

" Try to be smart about case-sensitivity.
set ignorecase
set smartcase
set infercase

" Use the OneDark colorscheme for Vim in general and air-line.
" See: https://github.com/joshdick/onedark.vim
"colorscheme onedark
" See: https://github.com/joshdick/onedark.vim#vim-airline-theme
let g:airline_theme='onedark'
" Do not show the default statusline since air-line is present.
" Otherwise you would see two statuslines.
set noshowmode

" Enable syntax highlighting.
syntax on

nmap <C-p> :Files<CR>

" YAML comments
" https://stackoverflow.com/questions/51059357/vim-wrong-indent-when-comment-lines-of-yaml-file
autocmd FileType yaml setlocal indentkeys-=0#
