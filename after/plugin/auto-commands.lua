-- local vim = vim
-- local api = vim.api
--
-- function nvim_create_augroups(definitions)
-- 	for group_name, definition in pairs(definitions) do
-- 		api.nvim_command("augroup " .. group_name)
-- 		api.nvim_command("autocmd!")
-- 		for _, def in ipairs(definition) do
-- 			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
-- 			api.nvim_command(command)
-- 		end
-- 		api.nvim_command("augroup END")
-- 	end
-- end
--
-- local autoCommands = {
-- 	-- other autocommands
-- 	open_folds = {
-- 		{ "BufReadPost,FileReadPost", "*", "normal zR" },
-- 	},
-- }
--
-- nvim_create_augroups(autoCommands)

-- vim.api.nvim_create_autocmd("RecordingEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.notify(" Started", "info", { title = "Macro" })
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("RecordingLeave", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.notify(" Recorded", "info", { title = "Macro" })
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	desc = "Start Alpha when vim is opened with no arguments",
-- 	group = group_name,
-- 	callback = function()
-- 		local should_skip = false
-- 		if vim.fn.argc() > 0 or vim.fn.line2byte("$") ~= -1 or not vim.o.modifiable then
-- 			should_skip = true
-- 		else
-- 			for _, arg in pairs(vim.v.argv) do
-- 				if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
-- 					should_skip = true
-- 					break
-- 				end
-- 			end
-- 		end
-- 		if not should_skip then
-- 			if is_available("bufferline.nvim") then
-- 				pcall(require, "bufferline")
-- 			end -- TODO v3: remove this line
-- 			require("alpha").start(true)
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("User", {
	pattern = "GitConflictDetected",
	callback = function()
		vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"), "info")
		-- vim.keymap.set("n", "cww", function()
		-- 	engage.conflict_buster()
		-- 	-- create_buffer_local_mappings()
		-- 	vim.keymap.set("n", "co", "<Plug>(git-conflict-ours)")
		-- 	vim.keymap.set("n", "ct", "<Plug>(git-conflict-theirs)")
		-- 	vim.keymap.set("n", "cb", "<Plug>(git-conflict-both)")
		-- 	vim.keymap.set("n", "c0", "<Plug>(git-conflict-none)")
		-- 	vim.keymap.set("n", "]x", "<Plug>(git-conflict-prev-conflict)")
		-- 	vim.keymap.set("n", "[x", "<Plug>(git-conflict-next-conflict)")
		-- end)
	end,
})
