" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeAutoDeleteBuffer = 1 " deletes the buffer of deleted file
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0" " dont show the arrows
let NERDTreeDirArrowCollapsible = "\u00a0" " dont show the arrows
let NERDTreeShowHidden=1 " show hidden files
" autocmd FileType nerdtree nmap <buffer> h <Enter>
" autocmd FileType nerdtree nmap <buffer> l <Enter>
" autocmd FileType nerdtree nmap <buffer> e <Backspace>
" autocmd FileType nerdtree cnoreabbrev <buffer> wq q
set modifiable " enables to delete files

