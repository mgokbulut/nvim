"   ____                           _
"  / ___| ___ _ __   ___ _ __ __ _| |
" | |  _ / _ \ '_ \ / _ \ '__/ _` | |
" | |_| |  __/ | | |  __/ | | (_| | |
"  \____|\___|_| |_|\___|_|  \__,_|_|

syntax enable                           " Enables syntax highlighing
set number                              " Line numbers
set clipboard=unnamedplus               " Sync system clipboard with vim
set iskeyword+=-                      	" treat dash separated words as a word text object"
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set scrolloff=10 	            		" Keep 10 lines below and above the cursor when scrolling
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set nobackup                            " makes no backup. Recommended by coc.vim
set undofile
set undodir=~/.config/nvim/undodir      " saves the history of changes even when closed.
" set backspace=eol,start,indent        " looks like backspace behaviour is fine in neovim, if not, enable this command
" set whichwrap+=<,>,[,],h,l            " when you press l at the end of the line, it will to to the next line
" set encoding=utf-8                    " The encoding displayed
" set fileencoding=utf-8                " The encoding written to file

"  ___           _            _        _   _
" |_ _|_ __   __| | ___ _ __ | |_ __ _| |_(_) ___  _ __
"  | || '_ \ / _` |/ _ \ '_ \| __/ _` | __| |/ _ \| '_ \
"  | || | | | (_| |  __/ | | | || (_| | |_| | (_) | | | |
" |___|_| |_|\__,_|\___|_| |_|\__\__,_|\__|_|\___/|_| |_|

set tabstop=4 softtabstop=4             " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set copyindent                          " copy the previous indentation on autoindenting


"  ____  _        _               _     _
" / ___|| |_ __ _| |_ _   _ ___  | |   (_)_ __   ___
" \___ \| __/ _` | __| | | / __| | |   | | '_ \ / _ \
"  ___) | || (_| | |_| |_| \__ \ | |___| | | | |  __/
" |____/ \__\__,_|\__|\__,_|___/ |_____|_|_| |_|\___|

set laststatus=2                        " Always display the status line. 0:never, 1:more than one window, 2: always
set showtabline=1                       " Always show tab line.           0:never, 1:more than one window, 2: always
set shortmess-=filnx                    " show the messages in full format. read more :help shortmess
" set noshowmode                        " We don't need to see things like -- INSERT -- anymore


"   ____
"  / ___|   _ _ __ ___  ___  _ __
" | |  | | | | '__/ __|/ _ \| '__|
" | |__| |_| | |  \__ \ (_) | |
"  \____\__,_|_|  |___/\___/|_|

set noruler             		        " does not shows the cursor coordinates at status bar
" set ruler             		        " shows the cursor coordinates at status bar
" set cursorline                        " Enable highlighting of the current line


"   ____      _                     _
"  / ___|___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___
" | |   / _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \
" | |__| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/
"  \____\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___|

set background=dark                     " tell vim what the background color looks like
set t_Co=256                            " Support 256 colors
set termguicolors                       " makes colorizer.lua work


"  _____                          _   _   _
" |  ___|__  _ __ _ __ ___   __ _| |_| |_(_)_ __   __ _
" | |_ / _ \| '__| '_ ` _ \ / _` | __| __| | '_ \ / _` |
" |  _| (_) | |  | | | | | | (_| | |_| |_| | | | | (_| |
" |_|  \___/|_|  |_| |_| |_|\__,_|\__|\__|_|_| |_|\__, |
"                                                 |___/

" Stop newline continution of comments. cro: c=insert, r=wrap, o=normal mode
autocmd BufEnter * setlocal formatoptions-=cro
" fix textlimit of .txt files
" autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

"  ____                      _     _
" / ___|  ___  __ _ _ __ ___| |__ (_)_ __   __ _
" \___ \ / _ \/ _` | '__/ __| '_ \| | '_ \ / _` |
"  ___) |  __/ (_| | | | (__| | | | | | | | (_| |
" |____/ \___|\__,_|_|  \___|_| |_|_|_| |_|\__, |
"                                          |___/

set incsearch                           " incremental search




"  __  __                   _
" |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
" | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
" | |  | | (_| | |_) | |_) | | | | | (_| \__ \
" |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"              |_|   |_|            |___/


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
nnoremap \ :noh<return>

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

" vv to select line to the end
vnoremap v $h

" Use backspace key for matching parens
nmap <BS> %
xmap <BS> %

" Allow misspellings
cnoreabbrev qq q!
cnoreabbrev Q q
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")


"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  "  __  __           _     _   _
  " |  \/  |_   _ ___| |_  | | | | __ ___   _____  ___
  " | |\/| | | | / __| __| | |_| |/ _` \ \ / / _ \/ __|
  " | |  | | |_| \__ \ |_  |  _  | (_| |\ V /  __/\__ \
  " |_|  |_|\__,_|___/\__| |_| |_|\__,_| \_/ \___||___/
" =====================================================

  " Surround (ysiw, cs etc.)
  Plug 'tpope/vim-surround'
  " Repeating plugin mappings
  Plug 'tpope/vim-repeat'
  " vim and tmux navigation integration
  Plug 'christoomey/vim-tmux-navigator'

"  ____  _                 _     _   _   _
" / ___|| |__   ___  _   _| | __| | | | | | __ ___   _____  ___
" \___ \| '_ \ / _ \| | | | |/ _` | | |_| |/ _` \ \ / / _ \/ __|
"  ___) | | | | (_) | |_| | | (_| | |  _  | (_| |\ V /  __/\__ \
" |____/|_| |_|\___/ \__,_|_|\__,_| |_| |_|\__,_| \_/ \___||___/
" ==============================================================


  " lsp plugins
  " Plug 'neovim/nvim-lspconfig'
  " NERD tree will be loaded on the first invocation of NERDTreeToggle command
  " Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }





"   ____            _     _   _   _
"  / ___|___  _   _| | __| | | | | | __ ___   _____  ___
" | |   / _ \| | | | |/ _` | | |_| |/ _` \ \ / / _ \/ __|
" | |__| (_) | |_| | | (_| | |  _  | (_| |\ V /  __/\__ \
"  \____\___/ \__,_|_|\__,_| |_| |_|\__,_| \_/ \___||___/
" ========================================================
  " test vim speed
  Plug 'tweekmonster/startuptime.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"  _____
" |_   _| __ ___  _   ___  __
"   | || '_ ` _ \| | | \ \/ /
"   | || | | | | | |_| |>  <
"   |_||_| |_| |_|\__,_/_/\_\

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>


"  ___        __
" |_ _|_ __  / _| ___
"  | || '_ \| |_ / _ \
"  | || | | |  _| (_) |
" |___|_| |_|_|  \___/

" use :Startuptime to test the speed

" ==========================================================
" 12 February 2021 - Bare minimum vimrc with only 3 plugins.
" ==========================================================
"     Total Time:   53.571 -- Flawless Victory
"
"     Slowest 7 plugins (out of 7)~
"              [runtime]	31.080
"              [unknown]	13.192
"                [vimrc]	8.043
"           vim-surround	0.647
"                matchit	0.327
"     vim-tmux-navigator	0.261
"        startuptime.vim	0.021

" =========================================================================
" 12 February 2021 - the old bloated vimrc benchmark for future comparison.
" =========================================================================
" Total Time:  143.642 -- Flawless Victory
"
" Slowest 10 plugins (out of 35)~
"                  [vimrc]	48.844
"             vim-polyglot	25.933
"                [runtime]	21.707
"                [unknown]	12.942
"              vim-airline	8.297
"                 coc.nvim	6.772
" nvcode-color-schemes.vim	4.084
"             vim-devicons	2.933
"          nvim-treesitter	1.668
"            vim-code-dark	1.230


" =========================================================================
" 13 February 2021 - nvim-lspconfig is added
" =========================================================================
" Total Time:   64.451 -- Flawless Victory
" 
" Slowest 8 plugins (out of 8)~
"          [runtime]	31.352  
"          [unknown]	13.797  
"            [vimrc]	9.024   
"     nvim-lspconfig	8.978   
"       vim-surround	0.662   
"            matchit	0.314   
" vim-tmux-navigator	0.298   
"    startuptime.vim	0.025   
