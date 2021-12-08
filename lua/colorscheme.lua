-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------

-- local map = vim.api.nvim_set_keymap  -- set global keymap
-- local exec = vim.api.nvim_exec 	-- execute Vimscript
-- local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local cmd = vim.cmd     				-- execute Vim commands
local opt = vim.opt         		-- global/buffer/windows-scoped options

opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme gruvbox]]
