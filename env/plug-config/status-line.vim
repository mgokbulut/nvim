function! InactiveLine()
    return luaeval("require'./env/lua/status-line'.inActiveLine()")
endfunction

function! ActiveLine()
    return luaeval("require'./env/lua/status-line'.activeLine()")
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END

function! TabLine()
    return luaeval("require'./env/lua/status-line'.TabLine()")
endfunction

set tabline=%!TabLine()
