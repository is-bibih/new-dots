
" **** custom statusline ****
set laststatus=2

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! FancyMode()
	let s:mode_map = {'n' : 'NORMAL',
		\ 'i' : 'INSERT',
		\ 'v' : 'VISUAL',
		\ 'V' : 'V-LINE',
		\ "\<C-v>" : 'V-BLOCK',
		\ 's' : 'SELECT',
		\ 'S' : 'S-LINE',
		\ "\<C-s>" : 'S-BLOCK',
		\ 'R' : 'REPLACE',
		\ '!' : 'SHELL'}
	return get(s:mode_map, mode(), '')
endfunction

hi User1 ctermfg=black ctermbg=red
"hi User1 ctermfg=black ctermbg=red cterm=bold
hi User2 ctermfg=black ctermbg=yellow
hi User3 ctermfg=black ctermbg=green
hi User4 ctermfg=black ctermbg=cyan

set statusline=
set statusline+=%1*\ %1*
set statusline+=%{FancyMode()}
set statusline+=\ %2*\ 
set statusline+=%{StatuslineGit()}
set statusline+=\ ♥\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%3*
set statusline+=\ %y
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %4*\ %4*
set statusline+=%p%%
set statusline+=\ %l:%c
set statusline+=\ 

