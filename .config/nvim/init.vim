" --- editing ---

set nocompatible
set clipboard=unnamedplus
set mouse=a
set autoread
set wildmenu
set ttyfast

" --- search ---

set showmatch
set hlsearch
set incsearch

" --- appearance ---

set scrolloff=10

" indent

filetype plugin on
filetype plugin indent on
set autoindent

" tabs

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" status line
set noshowmode
set shortmess+=F

" line number

set number
set relativenumber

" linebreaks

set wrap linebreak
set breakindent

" colors
syntax enable
set background=dark

" --- plugins ---

" fetch plugins if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'vim-scripts/todo-txt.vim'
Plug 'luizribeiro/vim-cooklang', { 'for': 'cook' }
Plug 'jasonccox/vim-wayland-clipboard'

call plug#end()

" install coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-marketplace', 'coc-pyright', 'coc-rome', 'coc-vimtex', 'coc-texlab', 'coc-snippets', 'coc-clangd']

" --- autoload other config files ---

for f in split(glob('~/.config/nvim/autoload/*.vim'), '\n')
    exe 'source' f
endfor

