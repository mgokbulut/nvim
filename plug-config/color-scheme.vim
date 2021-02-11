" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },       -- list of language that will be disabled
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
" let g:airline_theme = "onedark"
" colorscheme aurora
let g:airline_theme = "codedark"
colorscheme nvcode
    " nvcode (basically just dark+)
    " onedark
    " nord
    " aurora (more colorful nord)
    " gruvbox
    " palenight
    " snazzy
    " dracula
" let g:airline_theme = "codedark"
" hi CocCodeLens guifg=White " -> codelens is the -> referance 5 (near function declerations)

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" |=============> Set Colorscheme <=======================|

" colorscheme codedark
" let g:airline_theme = "codedark"

" colorscheme gruvbox
" let g:airline_theme = "gruvbox"

" colorscheme onedark
" let g:airline_theme= "onedark"

" colorscheme palenight
" let g:airline_theme = "palenight"

" colorscheme nord
" let g:airline_theme = "nord"

" colorscheme dracula
" let g:airline_theme = "dracula"

" colorscheme atom-dark
" let g:airline_theme = "codedark"

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

" |=====================================================|

" Allow nvim to be transparent
" makes only one tab have the cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" for transparent background
function! AdaptColorscheme()
   highlight clear CursorLine
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE

highlight clear LineNr
highlight clear SignColumn

" Change Color when entering Insert Mode
autocmd InsertEnter * set nocursorline

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * set nocursorline

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

function! ChangeColorscheme(option)
   "applies colorscheme
   if a:option == 1
      colorscheme gruvbox
      let g:airline_theme = "gruvbox"
      echom "[ColorScheme] gruxbox is active"
   elseif a:option == 2
      colorscheme codedark
      let g:airline_theme = "codedark"
      echom "[ColorScheme] codedark is active"
   elseif a:option == 3
      colorscheme aurora
      let g:airline_theme= "onedark"
      echom "[ColorScheme] aurora is active"
   elseif a:option == 4
      colorscheme palenight
      let g:airline_theme = "codedark"
      echom "[ColorScheme] palenight is active"
   elseif a:option == 5
      colorscheme nord
      let g:airline_theme = "nord"
      echom "[ColorScheme] nord is active"
   elseif a:option == 6
      colorscheme dracula
      let g:airline_theme = "codedark"
      echom "[ColorScheme] dracula is active"
   elseif a:option == 7
      colorscheme onedark
      let g:airline_theme= "onedark"
      echom "[ColorScheme] onedark is active"
   elseif a:option == 8
      colorscheme snazzy
      let g:airline_theme= "onedark"
      echom "[ColorScheme] snazzy is active"
   endif
   hi! Normal ctermbg=NONE guibg=NONE
   hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
   redraw
endfunction

"command! -nargs=1 ChangeColorscheme call ChangeColorscheme(<args>)

" |=====================================================|

