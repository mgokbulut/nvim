let g:plugins_enabled=1
let g:lua_enabled=1

source $HOME/.config/nvim/env/functions.vim
source $HOME/.config/nvim/env/settings.vim
source $HOME/.config/nvim/env/mappings.vim
source $HOME/.config/nvim/env/plugins.vim

" for f in split(glob('~/.config/nvim/env/*.vim'), '\n')
"     exe 'source' f
" endfor


" ==========================================================
" ========== APPLICATION - PLUGIN SYNCRONIZATION ===========
" ==========================================================

" /Users/mgokbulut/.local/share/nvim/rplugin.vim
" currently fzf is commented to improve performance.
" PERFORMANCE INCREASE: about 10ms increase

" ==========================================================
"  ___        __
" |_ _|_ __  / _| ___
"  | || '_ \| |_ / _ \
"  | || | | |  _| (_) |
" |___|_| |_|_|  \___/

" use :Startuptime to test the speed

" ==========================================================
" 12 February 2021 - 0 plugins installed
" ==========================================================
" Total Time:   51.555 -- Flawless Victory
"
" Slowest 5 plugins (out of 5)~
"       [runtime]	30.697
"       [unknown]	13.327
"         [vimrc]	7.207
"         matchit	0.303
" startuptime.vim	0.021

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
" 13 February 2021 - only nvim-lspconfig is added
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

" =========================================================================
" 13 February 2021 - only gruvbox8 is added
" =========================================================================
" Total Time:   59.025 -- Flawless Victory
"
" Slowest 8 plugins (out of 8)~
"          [runtime]	32.670
"          [unknown]	13.809
"            [vimrc]	9.134
"       vim-gruvbox8	2.069
"       vim-surround	0.693
"            matchit	0.350
" vim-tmux-navigator	0.277
"    startuptime.vim	0.023
