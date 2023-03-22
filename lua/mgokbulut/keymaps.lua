local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Change leader key and disable space
map("n", "<space>", "<nop>", { noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visual mode, Better indenting
map("v", "<", "<gv", default_opts)
map("v", ">", ">gv", default_opts)

-- Visual mode, better yanking
map("v", "y", "ygv", default_opts)

-- Visual mode, Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_opts)
map("x", "J", ":move '>+1<CR>gv-gv", default_opts)
map("x", "L", ">gv", default_opts)
map("x", "H", "<gv", default_opts)

-- Don't use arrow keys
-- map("n", "<up>", ':echoe "Use k"<cr>', { noremap = true })
-- map("n", "<down>", ':echoe "Use j"<cr>', { noremap = true })
-- map("n", "<left>", ':echoe "Use h"<cr>', { noremap = true })
-- map("n", "<right>", ':echoe "Use l"<cr>', { noremap = true })

-- Center when searching
map("n", "n", "nzz", default_opts)
map("n", "N", "Nzz", default_opts)
map("n", "*", "*zz", default_opts)
map("n", "#", "#zz", default_opts)
map("n", "g*", "g*zz", default_opts)
map("n", "g#", "g#zz", default_opts)
map("n", "<C-o>", "<C-o>zz", default_opts)

-- better up/down
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Faster scrolling
map("n", "J", "v:count == 0 ? '4gj' : 'j'", { expr = true, silent = true })
map("n", "K", "v:count == 0 ? '4gk' : '4k'", { expr = true, silent = true })
map("n", "L", "2l", default_opts)
map("n", "H", "2h", default_opts)

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
map("c", "qQ", "q!", default_opts)
map("c", "qw", "wq", default_opts)
vim.cmd([[command W :w]])
vim.cmd([[command Q :q]])
vim.cmd([[command Wq :wq]])
vim.cmd([[command WQ :wq]])
vim.cmd([[command Bd :bd]])

-- Don't open command history
map("n", "q:", "<nop>", default_opts)

-- Don't enter ex mode
map("n", "Q", "<nop>", default_opts)

-- Find and Replace shortcut TODO: Change this!
map("n", "S", ":%s//gI<Left><Left><Left>", default_opts)

-- Remove default functionality of s
map("n", "s", "<nop>", default_opts)

-- Search visually highlighted text
map("v", [[g/]], [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], default_opts)

-- Stop highlighting of search results
map("n", [[//]], [[:nohlsearch<C-R>=has('diff')?'<BAR>diffupdate':''<CR><CR>]], default_opts)

-- Cursor stay at the same position
map("n", "gJ", "mzgJ`z", default_opts)

-- Back slash gets rid of the highligting after search
map("n", "\\", ":noh<return>", default_opts)
map("n", "<c-\\>", ":noh<return>", default_opts)

-- Tab to go to next buffer
-- map("n", "<TAB>", ":bnext<CR>", default_opts)
-- map("n", "<S-TAB>", ":bprevious<CR>", default_opts)

-- ]b to go to next buffer
map("n", "]b", ":bnext<CR>", default_opts)
map("n", "[b", ":bprevious<CR>", default_opts)

-- Navigating quick fix list
map("n", "]q", ":cnext<cr>", default_opts)
map("n", "[q", ":cprev<cr>", default_opts)

-- Better pasting
-- map("v", "P", ":<BS>%s/<C-R><C-W>/<C-R>0/gI<CR><C-o>", default_opts)
-- map("n", "p", "p`[v`]o", default_opts)
-- map("n", "P", "P`[v`]o", default_opts)
map("n", "p", "p`[v`]", default_opts)
map("n", "P", "P`[v`]", default_opts)

-- Don't copy when pasted
-- map("v", "p", '"_dP`[v`]o', default_opts)
map("v", "p", '"_dP`[v`]', default_opts)

-- Better undo/redo
map("n", "R", "<c-r>", default_opts)

-- Don't yank when x
map("n", "x", '"_x', default_opts)

-- Goto previous place
-- map("n", "<c-p>", "U", default_opts)

-- search word and keep on the word
-- map("n", "gw", "*N")
-- map("x", "gw", "*N")
map("n", "*", "*Nzz", default_opts)
map("x", "*", "*Nzz", default_opts)

-- but blank line below
-- map("n", "<cr>", "o<esc>k", default_opts)
-- map("n", "<cr>", "i<cr><esc><c-o>", default_opts)
map("n", "<cr>", "<nop>", default_opts)

-- Auto indentation on empty lines
function autoIndent(key)
	return function()
		return string.match(vim.api.nvim_get_current_line(), "%g") == nil and '"_cc' or key
	end
end

vim.keymap.set("n", "i", autoIndent("i"), { expr = true, noremap = true })
vim.keymap.set("n", "I", autoIndent("I"), { expr = true, noremap = true })
vim.keymap.set("n", "a", autoIndent("a"), { expr = true, noremap = true })
vim.keymap.set("n", "A", autoIndent("A"), { expr = true, noremap = true })

-- Delete without yanking an empty line (also line only with spaces)
function betterDelete()
	return string.match(vim.fn.getline("."), "%S") == nil and '"_dd' or "dd"
end

vim.keymap.set("n", "dd", betterDelete, { expr = true, noremap = true })

map("n", "0", "^", default_opts)
map("n", "^", "0", default_opts)

function delete_until_start_of_line()
	-- Get the current line and cursor position
	local line = vim.api.nvim_get_current_line()
	local col = vim.fn.col(".")

	-- Check if there is anything before the cursor on the current line
	if string.sub(line, 1, col - 1):match("[^%s]") then
		-- If there is, just delete one character with backspace
		-- vim.api.nvim_feedkeys("<BS>", "n", true)
		return "<BS>"
	else
		-- If there isn't, delete all characters until the start of the line
		-- vim.api.nvim_feedkeys("<C-u>", "n", true)
		return "<esc>^i<C-u>"
	end
end

vim.keymap.set("i", "<BS>", delete_until_start_of_line, { expr = true, noremap = true })

function smart_tab()
	-- Get the current line and cursor position
	local line = vim.api.nvim_get_current_line()
	local col = vim.fn.col(".")

	-- Check if there is anything before the cursor on the current line
	if string.sub(line, 1, col - 1):match("[^%s]") then
		return "\t"
	else
		-- return '<esc>^D"_cc <esc>vP^i'
		-- return "<esc>==I"
		return string.match(vim.fn.getline("."), "%S") == nil and '<esc>"_cc' or "<esc>==I"
	end
end

vim.keymap.set("i", "<TAB>", smart_tab, { expr = true, noremap = true })

-- local prev_line_num = 0
--
-- function on_cursor_moved()
-- 	local current_line_num = vim.fn.line(".")
-- 	if current_line_num ~= prev_line_num then
-- 		-- Cursor has moved to a different line
-- 		prev_line_num = current_line_num
-- 		-- Your code to handle cursor movement goes here
-- 	end
-- end

-- vim.api.nvim_set_decoration_provider(0, { on_win_pos_changed = on_cursor_moved })

function get_mark_line(mark)
	local line = vim.fn.line("'" .. mark)
	-- print(line)
	if line > 0 then
		return line
	else
		return nil
	end
end

-- _G.removeWhitespacePos = {}
_G.last_cursor_pos = {}
_G.prev_extmark_id = -1
_G.prev_bufnr = 0
_G.ns_id = vim.api.nvim_create_namespace("color_under_cursor_red")

function exclude_filetype(filetype)
	local filetype_exclude = {
		"dashboard",
		"neo-tree",
		"Trouble",
		"lazy",
		"help",
		"git",
		"markdown",
		"text",
		"terminal",
		"lspinfo",
		"packer",
		"TelescopePrompt",
	}

	-- check each one, if the filetype is matched, return false, if not return true
	for _, excluded_type in ipairs(filetype_exclude) do
		if filetype == excluded_type then
			return false -- exclude this filetype
		end
	end

	return true -- do not exclude this filetype
end

vim.api.nvim_create_autocmd({ "CursorMovedI" }, {
	pattern = "*",
	callback = function()
		-- vim.notify("inset")
		vim.api.nvim_buf_del_extmark(_G.prev_bufnr, _G.ns_id, _G.prev_extmark_id)
	end,
})

-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	pattern = "*",
	callback = function()
		local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())

		-- get rid of the previous mark if previous buffer exists
		if vim.api.nvim_buf_is_loaded(_G.prev_bufnr) then
			vim.api.nvim_buf_del_extmark(_G.prev_bufnr, _G.ns_id, _G.prev_extmark_id)
		end

		-- check if the cursor has moved vertically
		if
			vim.bo.buftype ~= "nofile"
			and cursor_pos[1] ~= 0
			and cursor_pos[1] ~= _G.last_cursor_pos
			and exclude_filetype(vim.bo.filetype)
		then
			local line = vim.api.nvim_get_current_line()
			local bufnr = vim.api.nvim_get_current_buf()

			-- if the line isn't empty and cursor is behind the first word, then ^
			if not string.sub(line, 1, vim.fn.col(".") - 1):match("[^%s]") then
				vim.api.nvim_feedkeys(vim.api.nvim_eval('"^"'), "n", true)
			end

			-- vim.api.nvim_buf_set_extmark(bufnr, _G.ns_id, cursor_pos[1] - 1, cursor_pos[2], {
			-- 	virt_text = { { "\t", "Cursor" }, { ">", "Error" } },
			-- 	-- virt_text_pos = "overlay",
			-- 	-- hl_group = "Error",
			-- 	-- end_col = cursor_pos[2] + 1,
			-- })

			-- TODO: if buffer exists, take it outside
			-- vim.notify(_G.prev_bufnr .. " ~ " .. _G.ns_id .. " ~ " .. _G.prev_extmark_id)

			-- print(vim.api.nvim_get_current_line())
			if cursor_pos[2] == 0 and (#line == 0) then
				-- find the previous non-empty line
				local prev_line_num = cursor_pos[1] - 1
				while prev_line_num > 0 do
					local prev_line = vim.api.nvim_buf_get_lines(bufnr, prev_line_num - 1, prev_line_num, false)[1]
					if prev_line:match("%S") then -- if the line is not empty or all whitespace
						local indent_level = vim.fn.indent(prev_line_num)
						if indent_level ~= 0 and string.match(prev_line, "[({[]%s*$") then
							indent_level = (indent_level + vim.api.nvim_get_option("shiftwidth"))
						end

						local extmark_id =
							vim.api.nvim_buf_set_extmark(bufnr, _G.ns_id, cursor_pos[1] - 1, cursor_pos[2], {
								-- virt_text = { { "\t", "Cursor" }, { ">", "Error" } },
								-- print(string.rep("\t", indent_level)),
								-- virt_text = { { string.rep(" ", indent_level - 1), "Cursor" }, { ">", "Error" } },
								virt_text = {
									{ string.rep(" ", indent_level - 1), "" },
									{ " ", "HighlighterColor" },
								},
							})
						-- set current value to be deleted
						_G.prev_extmark_id = extmark_id
						_G.prev_bufnr = bufnr
						return
					end
					prev_line_num = prev_line_num - 1
				end
			end

			-- Under DEV --

			-- local prev_line = vim.api.nvim_buf_get_lines(bufnr, cursor_pos[1] - 2, cursor_pos[1] - 1, false)[1]
			-- -- print(prev_line)
			-- local indent_level = vim.fn.indent(cursor_pos[1] - 1)
			-- if indent_level ~= 0 and string.match(prev_line, "[({[]%s*$") then
			-- 	print(indent_level + vim.api.nvim_get_option("shiftwidth"))
			-- 	-- expected_indent_level = expected_indent_level + vim.api.nvim_get_option("shiftwidth")
			-- else
			-- 	print(indent_level)
			-- end

			-- print(bufnr .. " - " .. ns_id .. " - " .. extmark_id)

			-- TODO: Uncomment for line start functionality
			-- if not string.sub(line, 1, cursor_pos[1] - 1):match("[^%s]") then
			-- 	vim.notify("yarrak")
			-- 	-- vim.api.nvim_feedkeys(vim.api.nvim_eval("^"), "m", true)
			-- end

			---------------------------------------------
			-- vim.notify("yarrak")
			-- vim.cmd("set undolevels=-1")
			-- vim.cmd("silent undojoin")
			-- vim.api.nvim_feedkeys(vim.api.nvim_eval('"cc \\<esc>"'), "n", true)
			-- print(#vim.api.nvim_get_current_line())
			-- -- vim.api.nvim_feedkeys(vim.api.nvim_eval('"0D"'), "m", true)

			-- vim.fn.feedkeys("i\\<esc>", "m")
			-- vim.api.nvim_feedkeys(vim.api.nvim_eval('"i"'), "m", true)
			-- vim.notify("heyya")
			-- vim.api.nvim_feedkeys(vim.api.nvim_eval('"\\<esc>"'), "m", true)

			-- vim.cmd("silent undojoin")
			-- vim.cmd("set undolevels=1000")
			-- vim.cmd("undojoin")

			-- Todo: just highlight the correct cell instead of moving the cursor
			-- print(_G.last_cursor_pos)
			-- vim.api.nvim_buf_add_highlight(0, -1, "Error", cursor_pos[1] - 1, cursor_pos[2] + 1, cursor_pos[2] + 2)
			-- vim.api.nvim_buf_clear_highlight(0, -1, cursor_pos[1] - 1, cursor_pos[1])
			-- local extmark_id = vim.api.nvim_buf_set_extmark(bufnr, -1, cursor_pos[2], {
			-- 	end_line = cursor_pos[1],
			-- 	hl_group = "Error",
			-- })

			-- ---------------------------------------------------------

			-- print(cursor_pos[1])
			-- local extmark_id = vim.api.nvim_buf_set_extmark(bufnr, ns_id, cursor_pos[1], cursor_pos[2] - 1, {
			-- 	end_col = cursor_pos[2] - 1,
			-- 	hl_group = "Error",
			-- })

			-- Remove whitespace from previous line
			-- if vim.tbl_isempty(_G.last_cursor_pos) then

			-- if next(_G.last_cursor_pos) == nil then
			-- 	-- vim.api.nvim_feedkeys(vim.api.nvim_eval('"gg"'), "m", true)
			-- end
			-- if not vim.tbl_isempty(_G.last_cursor_pos) then
			-- 	print(_G.last_cursor_pos)
			-- 	-- vim.api.nvim_feedkeys(vim.api.nvim_eval('"gg"'), "m", true)
			-- end
			-- if vim.api.nvim_buf_get_lines(0, _G.last_cursor_pos - 1, _G.last_cursor_pos, false)[1]:match("[^%s]") then
			-- 	vim.notify("yarrak")
			-- end

			-- sets last cursor position
			_G.last_cursor_pos = cursor_pos[1]
		end

		-- vim.notify(string.format("%d", cursor_pos))

		-- local buftype = vim.bo.buftype
		-- if buftype ~= "nofile" and cursor_pos[2] == 0 and (#line == 0) then
		-- 	-- vim.cmd("set undolevels=-1")
		-- 	-- -- vim.cmd("silent undojoin")
		-- 	-- -- vim.api.nvim_feedkeys(vim.api.nvim_eval('"i \\<esc>"'), "m", true)
		-- 	-- -- vim.cmd("silent undojoin")
		-- 	-- vim.cmd("set undolevels=1000")
		-- 	-- vim.cmd("undojoin")
		--
		-- 	-- vim.notify("yarrak")
		-- 	-- if not vim.api.nvim_get_current_line():match("[^%s]") then
		-- 	-- vim.api.nvim_feedkeys('"_cc \\<esc>', "n", true)
		-- 	-- vim.api.nvim_input("<esc>")
		--
		-- 	-- local buf = vim.api.nvim_get_current_buf()
		-- 	-- vim.api.nvim_buf_set_option(0, "undo", false) -- disable undo
		-- 	--
		-- 	-- vim.api.nvim_exec([[i asdf]])
		--
		-- 	-- vim.cmd("normal! i \\<esc>")
		-- 	-- vim.cmd(":undojoin")
		--
		-- 	--
		-- 	-- vim.api.nvim_buf_set_option(0, "undo", true)
		--
		-- 	-- vim.api.nvim_input('"_cc <esc>')
		-- 	-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
		-- 	-- vim.api.nvim_feedkeys("<esc>", "n", true)
		-- end

		-- if not string.sub(line, 1, col - 1):match("[^%s]") then
		-- 	vim.notify("yarrak")
		-- 	-- return "^"
		-- 	-- vim.api.nvim_feedkeys(vim.api.nvim_eval("^"), "m", true)
		-- end

		-- if vim.api.nvim_get_current_line():match("[^%s]") then
		-- 	-- vim.notify("heyy")
		-- else
		-- 	-- vim.notify("neyyy")
		-- 	-- vim.api.nvim_buf_set_lines(0, _G.removeWhitespacePos[1] - 1, _G.removeWhitespacePos[1], false, { "" })
		-- 	-- vim.api.nvim_feedkeys('"_cc <esc>', "n", true)
		-- 	-- vim.cmd([["_cc <esc>]])
		-- end
	end,
})

-- 	pattern = "*",
-- 	callback = function()
-- 		-- print(_G.removeWhitespace)
-- 		if _G.removeWhitespace1 then
-- 			_G.removeWhitespace2 = true
-- 		elseif _G.removeWhitespace2 then
-- 			-- vim.api.nvim_feedkeys(string.format("%dG^D", _G.removeWhitespacePos[2]), "n", true)
-- 			-- local delete_cmd = string.format("d$%s", _G.removeWhitespacePos[1])
-- 			-- vim.api.nvim_feedkeys(delete_cmd, "n", true)
--
-- 			-- print(string.format(":%d normal! iasdf", _G.removeWhitespacePos[1]))
-- 			vim.api.nvim_buf_set_lines(0, _G.removeWhitespacePos[1] - 1, _G.removeWhitespacePos[1], false, { "" })
-- 			-- vim.api.nvim_feedkeys(string.format(":%d normal! ^D\n", _G.removeWhitespacePos[1] - 1), "n", true)
-- 			-- vim.cmd(string.format(":%d normal! dd", _G.removeWhitespacePos[1] - 1))
-- 			_G.removeWhitespace1 = false
-- 			_G.removeWhitespace2 = false
-- 		end
--
-- 		-- if execute then
-- 		-- 	execute = false
-- 		-- 	vim.cmd(mark_pos[2] .. "normal! iyarrak")
-- 		-- 	print("execute baby")
-- 		-- end
--
-- 		-- local current_pos = vim.fn.getpos("'z") -- change 'm' to the mark you want to track
-- 		-- if vim.tbl_isempty(prev_pos) or prev_pos[2] ~= current_pos[2] then
-- 		-- 	-- mark position has changed
-- 		-- 	-- print("Mark 'm' position changed to line " .. mark_pos[2])
-- 		-- 	print(current_pos)
-- 		-- 	if not vim.tbl_isempty(prev_pos) then
-- 		-- 		-- vim.cmd(current_pos[2] .. "normal! iyarrak")
-- 		-- 		-- vim.api.nvim_feedkeys(string.format("%dG^D", current_pos[2]), "n", true)
-- 		-- 		print("hello baby")
-- 		-- 		execute = true
-- 		-- 	end
-- 		-- end
-- 		-- prev_pos = current_pos
--
-- 		-- if vim.fn.getchar() == string.byte("'") and vim.fn.nr2char(vim.fn.getchar()) == "z" then
-- 		-- print("heyyyya")
-- 		-- end
-- 		-- if vim.fn.getcurpos()[2] ~= vim.fn.line("'z") then
-- 		-- 	print("heyyyya")
-- 		-- end
-- 		-- print(get_mark_line("z"))
-- 		-- if string.match(vim.fn.getline(get_mark_line("z")), "^%s*$") ~= nil then
-- 		-- 	-- print("heyyyya")
-- 		-- 	print(get_mark_line("z"))
-- 		-- 	-- vim.cmd(":" .. get_mark_line("z") .. " normal! 0D<c-o>")
-- 		-- end
-- 		-- if string.match(vim.api.nvim_get_current_line(), "^%s*$") ~= nil then
-- 		-- end
-- 		-- local bufnr = vim.api.nvim_get_current_buf()
-- 		-- local cursor = vim.api.nvim_win_get_cursor(0)
-- 		-- local line = vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1, cursor[1], false)[1]
-- 		-- local line_above = vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1 - 1, cursor[1] - 1, false)[1]
-- 		-- local line_below = vim.api.nvim_buf_get_lines(bufnr, cursor[1], cursor[1] + 1, false)[1]
-- 		-- print(cursor[1])
-- 		-- string.match(vim.fn.getline("."), "%S") == nil
-- 		-- if string.match(line_above, "%S") == nil then
-- 		-- 	-- vim.api.nvim_feedkeys(":normal! iHello<CR>", "n", true)
-- 		--
-- 		-- end
-- 		-- if line_above:match("[^%s]") then
-- 		-- end
-- 	end,
-- })

function smart_k()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1 - 1, cursor[1] - 1, false)[1]

	if line:match("[^%s]") then
		local col = vim.fn.col(".")
		if string.sub(line, 1, col - 1):match("[^%s]") then
			return "k"
		else
			return "k^"
		end
	else
		-- local buf = vim.api.nvim_get_current_buf()
		-- vim.api.nvim_buf_set_option(buf, 'undo', false)  -- disable undo
		-- -- do something
		-- vim.api.nvim_buf_set_option(buf, 'undo', true)  -- enable undo

		return 'k"_cc <esc>'
	end
end

function smart_j()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_buf_get_lines(bufnr, cursor[1], cursor[1] + 1, false)[1]

	if line:match("[^%s]") then
		local col = vim.fn.col(".")
		if string.sub(line, 1, col - 1):match("[^%s]") then
			return "j"
		else
			return "j^"
		end
	else
		return 'j"_cc <esc>'
	end
end

-- vim.keymap.set("n", "j", smart_j, { expr = true, noremap = true })
-- vim.keymap.set("n", "k", smart_k, { expr = true, noremap = true })

function move_cursor_right()
	-- return string.match(vim.fn.getline("."), "%S") == nil and '"_cc <esc>' or "j"
end

-- normal! "_cc
