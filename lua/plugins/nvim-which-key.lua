local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- hello
local mappings = {
	["/"] = { ":CommentToggle<cr>", "comment" },
	[";"] = { ":Commands", "commands" },
	["="] = { "<C-W>=", "balance windows" },
	[" "] = { '<cmd>lua require("telescope.builtin").find_files()<cr>', "find files" },
	f = { '<cmd>lua require("telescope.builtin").live_grep()<cr>', "find text" },
	b = { '<cmd>lua require("telescope.builtin").buffers()<cr>', "buffers" },
	h = { '<cmd>lua require("telescope.builtin").help_tags()<cr>', "help" },
	z = { ":MaximizerToggle<cr>", "maximizer" },
	e = { ":NvimTreeToggle<cr>", "file tree" },
	n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next diagnostic" },
	P = { "<cmd>Telescope projects<cr>", "Projects" },
	-- r = { ":!open -a 'google chrome' ./index.html<CR><CR>", "run" },
	r = { ":!tsc --build & open -a 'google chrome' ./src/index.html<CR><CR>", "run" },
	-- t     = { ':Term<cr>'                                              , 'terminal'},
	-- q     = { '<Plug>(coc-fix-current)'                                , 'quickfix' },
	--n     = { '<Plug>(coc-diagnostic-next)'                            , 'next diagnostic' },
	-- j     = { ':join'                                                  , 'join' },
	-- ['1'] = {':BufferLineGoToBuffer 1<cr>', 'which_key_ignore'},
	-- ['2'] = {':BufferLineGoToBuffer 2<cr>', 'which_key_ignore'},
	-- ['3'] = {':BufferLineGoToBuffer 3<cr>', 'which_key_ignore'},
	-- ['4'] = {':BufferLineGoToBuffer 4<cr>', 'which_key_ignore'},
	-- ['5'] = {':BufferLineGoToBuffer 5<cr>', 'which_key_ignore'},
	-- ['6'] = {':BufferLineGoToBuffer 6<cr>', 'which_key_ignore'},
	-- ['7'] = {':BufferLineGoToBuffer 7<cr>', 'which_key_ignore'},
	-- ['8'] = {':BufferLineGoToBuffer 8<cr>', 'which_key_ignore'},
	-- ['9'] = {':BufferLineGoToBuffer 9<cr>', 'which_key_ignore'},
}

mappings.m = { name = "move buffer" }
for i = 1, 9 do
	mappings[("%s").format(i)] = { ("<Plug>(cokeline-focus-%s)"):format(i), "which_key_ignore" }
	mappings["m"][("%s").format(i)] = { ("<Plug>(cokeline-switch-%s)"):format(i), ("%s"):format(i) }
end

-- for i = 1,9 do
--   mappings[('%s').format(i)] = {(':BufferLineGoToBuffer %s<CR>'):format(i), 'which_key_ignore'}
-- end

-- y is for actions
mappings.y = {
	name = "+yank",
	y = { ":%y+<cr>", "yank file" },
}

mappings.p = {
	name = "+paste",
	p = { ":%d | put +", "overwrite file" },
}

-- a is for actions
mappings.a = {
	name = "+actions",
	a = { "<cmd>Alpha<cr>", "Alpha" },
	h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	f = { ":!open .<cr>", "open in finder" },
	n = { ":set nonumber!<cr>", "line-numbers" },
	N = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	y = { ":%y+<cr>", "yank file" },
	S = { ":set spell!<cr>", "spelling" },
	s = { "<cmd>lua _SPOTIFY_TOGGLE()<cr>", "spotify" },
	r = { ":set norelativenumber!<cr>", "relative line nums" },
	C = { ":ColorizerToggle<cr>", "colorizer" },
	t = { "<cmd>lua _TASKELL_TOGGLE()<cr>", "Taskell" },
	T = { ":TransparentToggle<cr>", "transparent background" },
	l = { "<cmd>LspInstallInfo<cr>", "Lsp Installer" },
	m = { ':exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>', "mouse support" },
	-- c = {':CompileAndRun<cr>'                          , 'compile&run'},
	-- g = {':SignifyToggle<cr>'                          , 'signify'},
	-- T = {':call Toggle_transparent_background()<cr>'   , 'transparent background'},
	-- t = {':call TrimWhitespace()<cr>'                  , 'trim whitespaces'},
}

-- mappings.g = {
--   name = '+git',
--   G = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--   a = {':Git add .<cr>'                        , 'add all'},
--   b = {':Git blame<cr>'                        , 'blame'},
--   B = {':GBrowse<cr>'                          , 'browse'},
--   c = {':Git commit<cr>'                       , 'commit'},
--   D = {':Git diff<cr>'                         , 'diff'},
--   d = {':Gdiffsplit<cr>'                       , 'diff split'},
--   g = {':Git<cr>'                              , 'status'},
--   l = {':diffget //3<cr>'                      , 'get right'},
--   h = {':diffget //2<cr>'                      , 'get left'},
--   L = {':Git log<cr>'                          , 'log'},
--   p = {':Git push<cr>'                         , 'push'},
--   P = {':Git pull<cr>'                         , 'pull'},
--   -- r = {':GRemove<cr>'                          , 'remove'},
-- }

mappings.g = {
	name = "Git",
	g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	-- j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	-- k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	-- b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
	b = { ":Git blame<cr>", "blame" },
	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	u = {
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		"Undo Stage Hunk",
	},
	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	d = { ":Gdiffsplit<cr>", "diff split" },
	-- d = {
	--   "<cmd>Gitsigns diffthis HEAD<cr>",
	--   "Diff",
	-- },
}

mappings.l = {
	name = "+lsp",
	-- a = { '<cmd>lua require("functions").code_actions()<cr>', "code actions" },
	a = { ":CodeActionMenu<cr>", "code actions" },
	d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics" },
	I = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "formatting" },
	i = { "<cmd>LspInfo<cr>", "Info" },
	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	S = {
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		"Workspace Symbols",
	},
}

-- Visual block mode for lsp
vim.api.nvim_set_keymap("v", "<leader>la", ":CodeActionMenu<cr>", { noremap = true, silent = true })

-- l = {
--   name = "LSP",
--   a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--   d = {
--     "<cmd>Telescope lsp_document_diagnostics<cr>",
--     "Document Diagnostics",
--   },
--   w = {
--     "<cmd>Telescope lsp_workspace_diagnostics<cr>",
--     "Workspace Diagnostics",
--   },
--   f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
--   i = { "<cmd>LspInfo<cr>", "Info" },
--   I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--   j = {
--     "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
--     "Next Diagnostic",
--   },
--   k = {
--     "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
--     "Prev Diagnostic",
--   },
--   l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--   q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--   r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--   s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--   S = {
--     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--     "Workspace Symbols",
--   },
-- },

mappings.t = {
	name = "+test",
	n = { ":TestNearest<cr>", "nearest Ultest" },
	N = { ":TestNearest<cr>", "nearest" },
	t = { ":Ultest<cr>", "file ULtest" },
	f = { ":TestFile<cr>", "file" },
	s = { ":TestSuite<cr>", "Suite" },
	l = { ":TestLast<cr>", "last" },
	v = { ":TestVisit<cr>", "visit" },
}

mappings.s = {
	name = "Search",
	-- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
	M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	R = { "<cmd>Telescope registers<cr>", "Registers" },
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	C = { "<cmd>Telescope commands<cr>", "Commands" },
}

local settings = {
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
		winblend = 1,
	},
	layout = {
		height = { min = 4, max = 8 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 2, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	spelling = {
		enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		suggestions = 20, -- how many suggestions should be shown in the list?
	},
	presets = {
		z = true, -- bindings for folds, spelling and others prefixed with z
		g = true, -- bindings for prefixed with g
	},
	show_help = false, -- show help message on the command line when the popup is visible
}

local opts = {
	prefix = "<leader>",
}

--vim.cmd[[highlight WhichKeyFloat guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]]
which_key.setup(settings)
which_key.register(mappings, opts)
