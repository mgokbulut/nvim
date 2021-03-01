"Auto Whitspace trimming!!
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" ===============================================================================

"self descriptive -- highlights yanked text for a little extra visual feedback
augroup highlight_yank
    if has("nvim-0.5")
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    endif
augroup END

" ===============================================================================

" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(4000, funcref('s:empty_message'))
augroup END " Hide status line

" ===============================================================================

" make sure the python indenting is fixed
autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab
