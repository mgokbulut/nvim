-- local map = vim.api.nvim_set_keymap  -- set global keymap
-- local cmd = vim.cmd     				-- execute Vim commands
-- local exec = vim.api.nvim_exec 	-- execute Vimscript
-- local fn = vim.fn       				-- call Vim functions
-- local g = vim.g         				-- global variables
-- local opt = vim.opt         		-- global/buffer/windows-scoped options

local M = {}
-- function M.code_actions()
-- 	local opts = {
-- 		winblend = 15,
-- 		layout_config = {
-- 			prompt_position = "top",
-- 			width = 80,
-- 			height = 12,
-- 		},
-- 		borderchars = {
-- 			prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
-- 			results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
-- 			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- 		},
-- 		border = {},
-- 		previewer = false,
-- 		shorten_path = false,
-- 	}
-- 	local builtin = require("telescope.builtin")
-- 	local themes = require("telescope.themes")
-- 	builtin.lsp_code_actions(themes.get_dropdown(opts))
-- end
--
-- local function rename_loaded_buffers(old_name, new_name)
-- 	for _, buf in pairs(vim.api.nvim_list_bufs()) do
-- 		if vim.api.nvim_buf_is_loaded(buf) then
-- 			if vim.api.nvim_buf_get_name(buf) == old_name then
-- 				vim.api.nvim_buf_set_name(buf, new_name)
-- 				-- to avoid the 'overwrite existing file' error message on write
-- 				vim.api.nvim_buf_call(buf, function()
-- 					vim.cmd("silent! w!")
-- 				end)
-- 			end
-- 		end
-- 	end
-- end
--
-- function M.refactor_filename()
-- 	if require("nvim-tree.view").is_help_ui() then
-- 		return
-- 	end
-- 	local node = require("nvim-tree.lib").get_node_at_cursor()
-- 	if not node then
-- 		return
-- 	end
-- 	if node.name == ".." then
-- 		return
-- 	end -- if the path name is selected
-- 	if node["entries"] == nil then
-- 		local abs_path = node.absolute_path
-- 		local path = ""
-- 		local tmp = ""
-- 		-- get the path from abs_path
-- 		for char in abs_path:gmatch(".") do
-- 			tmp = tmp .. char
-- 			if char == "/" then
-- 				path = path .. tmp
-- 				tmp = ""
-- 			end
-- 		end
-- 		local new_name = vim.fn.input("Rename " .. node.name .. " to ")
-- 		local new_name_with_path = path .. new_name
-- 		-- local new_name = vim.fn.input("Rename " ..node.name.. " to ", abs_path)
-- 		require("nvim-tree.utils").clear_prompt()
--
-- 		if not new_name or #new_name == 0 then
-- 			return
-- 		end
--
-- 		if vim.loop.fs_access(new_name_with_path, "R") then
-- 			require("nvim-tree.utils").warn("Cannot rename: file already exists")
-- 			return
-- 		end
--
-- 		local success = vim.loop.fs_rename(node.absolute_path, new_name_with_path)
-- 		if not success then
-- 			return vim.api.nvim_err_writeln("Could not rename " .. node.absolute_path .. " to " .. new_name_with_path)
-- 		end
-- 		vim.api.nvim_out_write(node.absolute_path .. " ➜ " .. new_name_with_path .. "\n")
-- 		rename_loaded_buffers(node.absolute_path, new_name_with_path)
-- 		require("nvim-tree.events")._dispatch_node_renamed(abs_path, new_name_with_path)
-- 		require("nvim-tree.lib").refresh_tree()
--
-- 		local condition = vim.fn.input("Refactor? (y/n) ", "y")
-- 		if condition == "y" or condition == "Y" or condition == "yy" then
-- 			vim.api.nvim_exec(
-- 				-- ':Vsearch ' .. node.name, --TODO: Change this...
-- 				":silent! Vsearch " .. node.name,
-- 				false
-- 			)
-- 			vim.api.nvim_exec(":cdo %s/" .. node.name .. "/" .. new_name .. "/g | update", false)
-- 			vim.api.nvim_exec(":cfdo :bd", false)
-- 			return
-- 		else
-- 			return
-- 		end
--
-- 		-- use these if you want buffers to close
-- 		-- :cdo %s/baz/baz/g | update
-- 		-- :cfdo :bd
--
-- 		-- local l = vim.api.nvim_exec('echo getqflist()', true)
-- 		-- print(l)
-- 	else
-- 		print("directory")
-- 	end
-- end

function M.upgradedStart(callback)
	-- print(table.unpack(lineNum))
	local total_lines = vim.api.nvim_buf_line_count(0)
	local y, x = unpack(vim.api.nvim_win_get_cursor(0))
	local aboveCursorLine = unpack(vim.api.nvim_buf_get_lines(0, y - 2, y - 1, true))
	local belowCursorLine
	if y == total_lines then
		belowCursorLine = -1
	else
		belowCursorLine = unpack(vim.api.nvim_buf_get_lines(0, y, y + 1, true))
	end

	local cursorLine = unpack(vim.api.nvim_buf_get_lines(0, y - 1, y, true))
	local firstchar = string.sub(cursorLine, 1, 1)

	if aboveCursorLine == nil then
		callback()
	elseif (firstchar == "" or string.byte(firstchar) == 9) and cursorLine == "" then
		local count = 0
		local lockAbove = true
		local lockBelow = true
		for i = 1, 8 do
			local charAtAbove = string.sub(aboveCursorLine, i, i)
			local charAtBelow

			if belowCursorLine == -1 then
				lockBelow = false
			else
				charAtBelow = string.sub(belowCursorLine, i, i)
			end

			if charAtAbove == " " and lockAbove then
				count = count + 1
			elseif string.byte(charAtAbove) == 9 and lockAbove then
				count = count + 2
			elseif lockBelow and charAtBelow == " " then
				count = count + 1
				lockAbove = false
			elseif lockBelow and string.byte(charAtBelow) == 9 then
				count = count + 2
				lockAbove = false
			else
				break
			end
		end

		for i = 1, count do
			vim.cmd([[norm I ]])
		end
		vim.cmd([[:call feedkeys('a','n')]])
	else
		callback()
	end
end
return M

-- :lua require('functions').upgradedStart()<CR>
