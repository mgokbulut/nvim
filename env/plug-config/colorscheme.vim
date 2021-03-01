if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

set background=dark                     " tell vim what the background color looks like
" set t_Co=256                          " Support 256 colors
" let g:gruvbox_italic=1
" colorscheme gruvbox8
colorscheme gruvbox8
" Plug 'joshdick/onedark.vim'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'sonph/onehalf', { 'rtp': 'vim' }

let t:is_transparent = 1
function! Toggle_transparent_background()
  if t:is_transparent == 0
    colorscheme gruvbox8
    " highlight LineNr ctermbg=none guibg=NONE guifg=NONE ctermfg=NONE
    " autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    " autocmd WinLeave * setlocal nocursorline
    let t:is_transparent = 1
  else
    highlight Normal ctermbg=none guibg=NONE
    " highlight clear CursorLine
    " highlight LineNr ctermbg=none guibg=NONE guifg=NONE ctermfg=NONE
    " highlight Folded ctermbg=none
    " highlight NonText ctermbg=none
    " highlight SpecialKey ctermbg=none
    " highlight VertSplit ctermbg=none
    " highlight SignColumn ctermbg=none
    let t:is_transparent = 0
  endif
endfunction
autocmd VimEnter * call Toggle_transparent_background()
