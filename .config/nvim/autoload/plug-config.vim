
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
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-pdf',
    \ 'pdfdvi'           : '-pdfdvi',
    \ 'pdfps'            : '-pdfps',
    \ 'pdflatex'         : '-pdf',
    \ 'luatex'           : '-lualatex',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
\}

" ********* tex-conceal *********

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" ********* coc-snippets *********

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

