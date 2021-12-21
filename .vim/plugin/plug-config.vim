
" ********* vimtex *********

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
	    \ 'options' : [
    	\   '-pdf',
    	\   '-shell-escape',
    	\   '-verbose',
    	\   '-file-line-error',
    	\   '-synctex=1',
    	\   '-interaction=nonstopmode',
    	\ ],
\}

" ********* tex-conceal *********

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" ********* nerdtree *********

" nerdtree when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdtree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" nerdtree keybinding
map <C-n> :NERDTreeToggle<CR>

" close vim when only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ********* coc-snippets *********

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

