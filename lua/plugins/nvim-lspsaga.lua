local saga = require 'lspsaga'
saga.init_lsp_saga()

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd


map('n', 'gh', ':Lspsaga lsp_finder<CR>', default_opts)
map('n', 'gK', ':Lspsaga hover_doc<CR>', default_opts)
map('n', 'gs', ':Lspsaga signature_help<CR>', default_opts)
map('n', 'gr', ':Lspsaga rename<CR>', default_opts)
map('n', 'gD', ':Lspsaga preview_definition<CR>', default_opts)
