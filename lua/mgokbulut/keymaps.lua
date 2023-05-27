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
map("n", "L", "w", default_opts)
map("n", "H", "b", default_opts)

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
map("n", "*", "*N", default_opts) -- TODO: doesn't work
map("x", "*", "*N", default_opts) -- TODO: doesn't work

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

-- TODO: fix
-- vim.keymap.set("i", "<BS>", delete_until_start_of_line, { expr = true, noremap = true })

-- TODO: if you decided to use tab for completion, get rid of it
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

-- vim.keymap.set("i", "<TAB>", smart_tab, { expr = true, noremap = true })
-- map("i", "<TAB><TAB>", "<TAB>", default_opts)

map("n", ",", "<C-^>", default_opts)
map("n", "II", "^", default_opts)
map("n", "Ii", "^", default_opts)
map("n", "AA", "$", default_opts)
map("n", "Aa", "$", default_opts)

-- gc when visual mode
