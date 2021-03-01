" -------------- coc-explorer ----------------- "
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
" nnoremap <leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <leader>e :CocCommand explorer --toggle --sources=buffer+,file+<CR>

" disable indentLine on CoCExplorer buffer
" augroup disableOnCocExplorer
"   autocmd!
"   autocmd User CocExplorerOpenPre LeadingSpaceDisable
"   autocmd User CocExplorerOpenPre IndentLinesDisable
" augroup END
" autocmd disableOnCocExplorer * silent!

" for indentLine
let g:indentLine_fileTypeExclude = ['coc-explorer']

" autocmd BufEnter *coc-explorer* :!ls
autocmd BufEnter *coc-explorer* set cursorline
autocmd BufLeave *coc-explorer* set nocursorline

" quit explorer if thats the only buffer left
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | quit | endif

" If another buffer tries to replace explorer, put it in the other window, and bring back coc explorer.
autocmd BufEnter * if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer' && winnr('$') > 0 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" autocmd BufEnter * if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" let g:coc_explorer_global_presets = {
" \   '.vim': {
" \     'root-uri': '~/.config/nvim/init.vim',
" \   },
" \   'tab': {
" \     'position': 'tab',
" \     'quit-on-open': v:true,
" \   },
" \   'floating': {
" \     'position': 'floating',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingTop': {
" \     'position': 'floating',
" \     'floating-position': 'center-top',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingLeftside': {
" \     'position': 'floating',
" \     'floating-position': 'left-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingRightside': {
" \     'position': 'floating',
" \     'floating-position': 'right-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'simplify': {
" \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
" \   }
" \ }

" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

