return {
	{
		-- Detect tabstop and shiftwidth automatically
		'tpope/vim-sleuth'
	},
	{
		'abecodes/tabout.nvim',
		opts = {
			ignore_beginning = false,
		},
		wants = { 'nvim-treesitter' },
		after = { 'nvim-cmp' }
	},
	{
		"bkad/CamelCaseMotion",
		lazy = true,
		keys = {
			{ "w", "<Plug>CamelCaseMotion_w", silent = true },
			{ "b", "<Plug>CamelCaseMotion_b", silent = true },
			{ "e", "<Plug>CamelCaseMotion_e", silent = true },
		},
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		-- Keep the buffer alignment
		"famiu/bufdelete.nvim",
		lazy = true,
		cmd = "Bdelete",
		keys = {
			{ "bd",  "Bdelete",      noremap = true, silent = true, { mode = "c" } },
			{ "bdd", "Bdelete!",     noremap = true, silent = true, { mode = "c" } },
			{ "W",   ":Bdelete<cr>", noremap = true, silent = true, { mode = "n" } },
		},
	},
	{
		'numToStr/Comment.nvim',
		opts = {},
	},
	{
		"jesseleite/vim-noh",
	},
	{
		-- Surround
		"machakann/vim-sandwich",
		lazy = false,
	},
	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = { enable = false },
			navigation = { enable_default_keybindings = true },
			resize = { enable_default_keybindings = true },
		},
	},
	{
		"ahmedkhalf/project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = false,
		keys = {
			{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects", silent = true },
		},
		config = function()
			require("project_nvim").setup({
				silent_chdir = false,
				-- detection_methods = { "lsp", "pattern" },
				detection_methods = { "pattern" },
				show_hidden = true,
			})
			require("telescope").load_extension("projects")
		end,
	},
	{
		"rmagatti/auto-session",
		opts = {
			log_level = 'error',
			auto_session_enable_last_session = false,
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Documents/repositories/", "~/Downloads", "~/.config" },
			auto_session_use_git_branch = true,
		},
		config = function(_, opts)
			-- local function restore_nvim_tree()
			-- 	local nvim_tree = require("nvim-tree")
			-- 	nvim_tree.change_dir(vim.fn.getcwd())
			-- 	nvim_tree.refresh()
			-- end

			-- local function close_neo_tree()
			-- 	require("neo-tree.command").execute({ action = "close" })
			-- end
			--
			-- local function open_neo_tree()
			-- 	require("neo-tree.command").execute({ action = "close" })
			-- end

			-- local function open_neo_tree()
			-- 	-- require("neo-tree.command").execute({ action = "show" })
			--
			-- 	-- Use the current buffer's path as the starting point for the git search
			-- 	local current_file = vim.api.nvim_buf_get_name(0)
			-- 	local current_dir
			-- 	local cwd = vim.fn.getcwd()
			-- 	-- If the buffer is not associated with a file, return nil
			-- 	if current_file == '' then
			-- 		current_dir = cwd
			-- 	else
			-- 		-- Extract the directory from the current file's path
			-- 		current_dir = vim.fn.fnamemodify(current_file, ':h')
			-- 	end
			--
			-- 	-- Find the Git root directory from the current file's path
			-- 	local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')
			-- 			[1]
			-- 	if vim.v.shell_error ~= 0 then
			-- 		print 'Not a git repository. Searching on current working directory'
			-- 		-- return cwd
			-- 		execute_command(":cd " .. cwd .. "<cr>")
			-- 	end
			-- 	-- return git_root
			-- 	execute_command(":cd " .. git_root .. "<cr>")
			-- end

			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
			vim.g.auto_session_pre_save_cmds = { "tabdo NeoTreeClose" }
			-- vim.g.auto_session_pre_save_cmds = { close_neo_tree }
			-- vim.g.auto_session_post_save_cmds = { open_neo_tree }
			-- vim.g.auto_session_post_open_cmds = { open_neo_tree }
			-- vim.g.auto_session_post_restore_cmds = { open_neo_tree }

			require("auto-session").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",

		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 30, 1, 30 },
				padding = { 0, 2, 0, 2 },
			},
			layout = {
				height = { min = 4, max = 4 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 4,                -- spacing between columns
				align = "center",           -- align columns left, center or right
			},
			show_help = false,
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt", "alpha" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				mode = { "n", "v" },
				-- ["g"] = { name = "+goto" },
				-- ["]"] = { name = "+next" },
				-- ["["] = { name = "+prev" },
				-- ["gz"] = { name = "+surround" },
				-- ["<leader><tab>"] = { name = "+tabs" },
				-- ["<leader>b"] = { name = "+buffer" },
				-- ["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>a"] = {
					name = "+actions",
					m = { ':exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>', "Mouse support" },
				},
				["<leader>gh"] = { name = "+hunk" },
				-- ["<leader>gh"] = { name = "+hunks" },
				-- ["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>sn"] = { name = "+noice" },
				["<leader>b"] = { name = "+browse" },
				["<leader>bc"] = ":lua require('util.cheat-sheet').cht()<cr>",
				-- { ":lua require('util.cheat-sheet').cht()<cr>", desc = "Cheat sheet" },
				["<leader>r"] = { name = "+restore" },
				-- ["<leader>u"] = { name = "+ui" },
				-- ["<leader>w"] = { name = "+windows" },
				-- ["<leader>x"] = { name = "+diagnostics/quickfix" },
			})
		end,
	},
}
