-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Change leader key and disable space
map("n", "<space>", "<nop>", { noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- Better indenting
map("v", "<", "<gv", default_opts)
map("v", ">", ">gv", default_opts)

-- tab to adjust the indent level
-- map('v', '<TAB>', '>gv', default_opts)
-- map('v', '<S-TAB>', '<gv', default_opts)
-- map('x', '<TAB>', '>gv', default_opts)
-- map('x', '<S-TAB>', '<gv', default_opts)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_opts)
map("x", "J", ":move '>+1<CR>gv-gv", default_opts)
map("x", "L", ">gv", default_opts)
map("x", "H", "<gv", default_opts)

-- Move selected line / block of text in visual mode
-- map('x', 'K', '4k', default_opts)
-- map('x', 'J', '4j', default_opts)
-- map('x', 'L', '4l', default_opts)
-- map('x', 'H', '4h', default_opts)

-- don't use arrow keys
map("n", "<up>", ':echoe "Use k"<cr>', { noremap = true })
map("n", "<down>", ':echoe "Use j"<cr>', { noremap = true })
map("n", "<left>", ':echoe "Use h"<cr>', { noremap = true })
map("n", "<right>", ':echoe "Use l"<cr>', { noremap = true })

-- Center when searching
map("n", "n", "nzz", default_opts)
map("n", "N", "Nzz", default_opts)
map("n", "*", "*zz", default_opts)
map("n", "#", "#zz", default_opts)
map("n", "g*", "g*zz", default_opts)
map("n", "g#", "g#zz", default_opts)
-- map("n", "<C-o>", "<C-o>zz", default_opts)

-- Faster scrolling
map("n", "J", "4j", default_opts)
map("n", "K", "4k", default_opts)
map("n", "L", "4l", default_opts)
map("n", "H", "4h", default_opts)

-- Make visual mode consistent with other settings
map("v", "v", "<esc>V", default_opts)
map("n", "V", "v$h", default_opts)
map("n", "Y", "v$hy", default_opts)

-- Use backspace key for matching parens
map("n", "<BS>", "%", default_opts)
map("x", "<BS>", "%", default_opts)

-- Undo break points
map("i", ",", ",<c-g>u", default_opts)
map("i", ".", ".<c-g>u", default_opts)
map("i", "?", "?<c-g>u", default_opts)
map("i", "!", "!<c-g>u", default_opts)

-- Allow misspellings
map("c", "qq", "q!", default_opts)
-- map('c', 'Q', 'q', default_opts)
-- map('c', 'W', 'w', default_opts)
-- map("c", "qw", "wq", default_opts)
-- map("c", "Wq", "wq", default_opts)
-- map("c", "WQ", "wq", default_opts)
-- map("c", "wQ", "wq", default_opts)
-- map("c", "Qa", "qa", default_opts)
-- map("c", "Bd", "bd", default_opts)
-- map("c", "bD", "bd", default_opts)
vim.cmd([[command W :w]])
vim.cmd([[command Q :q]])
vim.cmd([[command Wq :wq]])
vim.cmd([[command WQ :wq]])
vim.cmd([[command Bd :bd]])

-- don't copy when pasted
map("v", "p", '"_dP', default_opts)

-- don't open command history
map("n", "q:", "<nop>", default_opts)

-- don't enter ex mode
map("n", "Q", "<nop>", default_opts)

-- Find and Replace shortcut
map("n", "S", ":%s//gI<Left><Left><Left>", default_opts)

-- remove default functionality of s
map("n", "s", "<nop>", default_opts)

-- back slash gets rid of the highligting after search
map("n", "\\", ":noh<return>", default_opts)

-- tab to go to next buffer
map("n", "<TAB>", ":bnext<CR>", default_opts)
map("n", "<S-TAB>", ":bprevious<CR>", default_opts)

-- Jumplist mutations (when C-o, C-i), add more points to the jump list
-- automatically add jumps > 5 to jump list
map("n", "k", [[(v:count > 1 ? "m'" . v:count : '') . 'k'"]], { expr = true })
map("n", "j", [[(v:count > 1 ? "m'" . v:count : '') . 'j'"]], { expr = true })

-- navigating quick fix list
map("n", "[q", ":cprev<cr>", default_opts)
map("n", "]q", ":cnext<cr>", default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal

-- Bufdelete
map("c", "bd", "Bdelete", default_opts)
map("n", "W", ":Bdelete<cr>", default_opts)

-- CamelCaseMotion
vim.cmd([[
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
]])

-- Autocommands
vim.cmd([[
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  command -nargs=* Vsearch vimgrep! /\v<args>/gj **/*
]])

-- Figlet
map("v", "<leader>f", ":FIGlet<cr>", default_opts)
