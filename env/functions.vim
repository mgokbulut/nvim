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
