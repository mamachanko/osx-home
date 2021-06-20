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

" Semantic Highlighting for Python in Neovim
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Automatically comply with Python's PEP8 rules for indentation.
" See: https://www.python.org/dev/peps/pep-0008/
Plug 'Vimjas/vim-python-pep8-indent'

" Provide linting. Especially nice for better shell scripts through shellcheck.
Plug 'dense-analysis/ale'

" Fzf for fuzzy finding files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
