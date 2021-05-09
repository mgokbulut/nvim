" ========== Mappings ========== "
let mapleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Use TAB to move between bufferes
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
xnoremap H <gv
xnoremap L >gv

" back slash gets rid of the highligting after search
nnoremap <silent>\ :noh<return>

" Disable arrow movement, resize splits instead.
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
" Disable arrow keys in normal mode
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" Disable arrow keys in elite mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Center when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Faster scrolling
nnoremap J 4j
nnoremap K 4k
nnoremap L 4l
nnoremap H 4h

" autocenter when entering insert mode
" autocmd InsertEnter * norm zz

" Close buffer without exitting neovim
nnoremap Q :bp<cr>:bd #<cr>

" Make visual mode consistent with other settings
vnoremap v <ESC>V
nnoremap V v$h

" Y to copy till end of the line
nnoremap Y v$hy

" autoclose parenthesis
" inoremap { {}<ESC>i
" inoremap [ []<ESC>i

" Use backspace key for matching parens
nmap <BS> %
xmap <BS> %

" Allow misspellings
cnoreabbrev qq q!
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
"nmap q <nop>
map <C-z> <nop>

nnoremap gl $
nnoremap gh ^
nnoremap S :%s//gI<Left><Left><Left>

" Open finder
command! Finder silent exe '!open ' . expand("%:p:h")

" map <silent><leader>s :setlocal spell spelllang=en_us<CR>

" function ToggleSpellCheck()
"     if &spell == 0
"         echom "enabled spellcheck"
"         setlocal spell spelllang=en_us
"     else
"         echom "disabled spellcheckamla beni"
"         set nospell
"     endif
" endfunction

" command! -nargs=0 ToggleSpellCheck call ToggleSpellCheck()
" map <silent><leader>s :ToggleSpellCheck

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")
