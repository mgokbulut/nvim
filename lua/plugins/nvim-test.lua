-- local map = vim.api.nvim_set_keymap  -- set global keymap
-- local exec = vim.api.nvim_exec 	-- execute Vimscript
-- local fn = vim.fn       				-- call Vim functions
-- local g = vim.g         				-- global variables
-- local cmd = vim.cmd     				-- execute Vim commands
-- local opt = vim.opt         		-- global/buffer/windows-scoped options

vim.g['test#strategy'] = 'neovim'
-- vim.g['ultest_use_pty'] = 1

-- vim.g['test#dart#patterns'] = {}
-- vim.g['test#dart#patterns']['test'] = {}
-- table.insert(vim.g['test#dart#patterns']['test'], [[\v^\s*def (test_\w+)]])
--
-- '\v^\s*test%(\(| )%("|'')(.*)%("|'')', '\v^\s*it%(\(| )%("|'')(.*)%("|'')'

-- vim.g['test#dart#patterns']['namespace'] = {'\v^\s*%(class|module) (\S+)', '\v^\s*describe%(\(| )%("|'')(.*)%("|'')', '\v^\s*describe%(\(| )(\S+)', '\v^\s*context%(\(| )%("|'')(.*)%("|'')', '\v^\s*context%(\(| )(\S+)'}
-- function echoStrategy(cmd)
--     --echo 'yarrak' . a:cmd
--     print("yarrak")
--     vim.cmd[[a.cmd]]
-- end
--
-- vim.g['test#custom_strategies'] = {}
-- vim.g['test#custom_strategies']['echo'] = echoStrategy
-- vim.g['test#strategy'] = 'echo'
