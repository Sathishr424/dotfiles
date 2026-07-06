" =========================
" Appearance
" =========================
syntax on
set termguicolors
colorscheme catppuccin_mocha

set number              " Show line numbers
set relativenumber      " Relative line numbers
set cursorline          " Highlight current line
set showmatch           " Highlight matching brackets
set scrolloff=8         " Keep 8 lines above/below cursor
set sidescrolloff=8

" =========================
" Indentation
" =========================
set autoindent
set smartindent
set expandtab           " Use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" =========================
" Searching
" =========================
set ignorecase          " Ignore case
set smartcase           " Unless uppercase is used
set incsearch           " Incremental search
set hlsearch            " Highlight matches

" Press <leader><space> to clear highlights
nnoremap <leader><space> :nohlsearch<CR>

" =========================
" Splits
" =========================
set splitbelow
set splitright

" =========================
" Clipboard
" =========================
set clipboard=unnamedplus

" =========================
" Mouse
" =========================
set mouse=a

" =========================
" Undo
" =========================
set undofile
set undodir=~/.vim/undo

" =========================
" Interface
" =========================
set nowrap
set ruler
set wildmenu
set wildmode=longest:full,full
set showcmd
set laststatus=2
set signcolumn=yes

" =========================
" Performance
" =========================
set updatetime=250
set timeoutlen=300

" =========================
" File Handling
" =========================
set hidden
set autoread

" =========================
" Better Backspace
" =========================
set backspace=indent,eol,start

" =========================
" Encoding
" =========================
set encoding=utf-8
set fileencoding=utf-8

" =========================
" Leader Key
" =========================
let mapleader=" "
