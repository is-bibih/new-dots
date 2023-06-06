set nocompatible

" --------- editing ---------

" set clipboard buffer to x primary buffer
set clipboard=unnamedplus

" enable mouse
set mouse=a

" incremental search
set incsearch

" filetype specific indents and autoindent
filetype indent on
set autoindent

" reload buffers on file change
set autoread

" set amount of lines to keep above and below cursor
set scrolloff=10

" better command completion
set wildmenu

" --------- appearance ---------

" syntax highlighting
filetype plugin on
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2

" disable showing active mode
set noshowmode
" disable displaying file name etc
set shortmess+=F

" line number column
set number
set relativenumber

" line wrapping
set wrap linebreak
" preserve indent after line wrapping
set breakindent

" colors
syntax enable
set background=dark
" fix artifacts?
set t_u7=
" fix statusline artifacts
set t_RV=

" --------- plugins ---------

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

