" ========= General ========= "
syntax on                               " Enables syntax highlighting
set number                              " Line numbers
set clipboard=unnamedplus               " Sync system clipboard with vim
set iskeyword+=-                      	" treat dash separated words as a word text object"
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow splitright               " Horizontal and Vertical splits will be swaped in place
set scrolloff=10 	            		" Keep 10 lines below and above the cursor when scrolling
set signcolumn=number                   " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set nobackup                            " makes no backup. Recommended by coc.vim
set undofile
set undodir=~/.config/nvim/undodir      " saves the history of changes even when closed.
set backupdir=~/.config/nvim/backupdir
set nowrap                              " Display long lines as just one line
set hidden                              " enable buffers to hide - prevents error: "E37: No write since last change ...
set encoding=utf-8                      " The encoding displayed
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set modifiable

" set lazyredraw                        " hopefully this speeds up vim!
" set wildmode=longest,list,full        " better auto completion in command mode
" set backspace=eol,start,indent        " looks like backspace behaviour is fine in neovim, if not, enable this command
" set whichwrap+=<,>,[,],h,l            " when you press l at the end of the line, it will to to the next line
" set fileencoding=utf-8                " The encoding written to file

" ========= Indentation ========= "
set tabstop=2 softtabstop=2             " Insert 4 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set copyindent                        " copy the previous indentation on autoindenting
"call :IndentLinesToggle " toggles the indentation line plugin

" ========= Status Line ========= "
" lua status line: https://www.reddit.com/r/neovim/comments/ff9m74/customize_your_status_line_using_lua/
" https://shapeshed.com/vim-statuslines/
set laststatus=2                        " Always display the status line. 0:never, 1:more than one window, 2: always
set showtabline=1                       " Always show tab line.           0:never, 1:more than one window, 2: always
set shortmess+=c                        " show the messages in full format. read more :help shortmess
" set noshowmode                        " We don't need to see things like -- INSERT -- anymore

set statusline=
set statusline+=%#Pmenu#
" set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=\ %#Pmenu#
set statusline+=\ %m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\︱
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=[%{&fileformat}\]
set statusline+=\︱
set statusline+=%p%%
set statusline+=\ \≡
set statusline+=\ %l:%L
set statusline+=╺

" ========== Cursor Line ========== "
set noruler             		        " does not shows the cursor coordinates at status bar
" set ruler             		        " shows the cursor coordinates at status bar
" set cursorline                        " Enable highlighting of the current line

" makes only one tab have the cursor line
augroup CursorLine
  " autocmd!
  " autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  " autocmd WinLeave * setlocal nocursorline
augroup END

" ========== Formatting ========== "
" Stop newline continuation of comments. cro: c=insert, r=wrap, o=normal mode
autocmd BufEnter * setlocal formatoptions-=cro
" fix textlimit of .txt files
" autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" ========== Searching ========== "
set incsearch                           " incremental search
" set noincsearch                       " incremental search
set ignorecase                          " ignore cases when searching
set smartcase                           " when you use a capital word, enables case sensitivity
set nowrapscan                          " do not wrap after getting to end of the file
