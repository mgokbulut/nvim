return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
	{
		"Mofiqul/dracula.nvim",
		config = function()
			vim.cmd.colorscheme("dracula")
		end,
	},
	{
		-- Camel case sensitive motion
		"bkad/CamelCaseMotion",
		lazy = true,
		keys = {
			{ "w", "<Plug>CamelCaseMotion_w", silent = true },
			{ "b", "<Plug>CamelCaseMotion_b", silent = true },
			{ "e", "<Plug>CamelCaseMotion_e", silent = true },
		},
	},
	{
		-- auto pairs
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		-- Keep the buffer alignment
		"famiu/bufdelete.nvim",
		lazy = true,
		cmd = "Bdelete",
		keys = {
			{ "bd", "Bdelete", noremap = true, silent = true, { mode = "c" } },
			{ "bdd", "Bdelete!", noremap = true, silent = true, { mode = "c" } },
			{ "W", ":Bdelete<cr>", noremap = true, silent = true, { mode = "n" } },
		},
	},
	{
		-- Commenting
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
				post = function()
					vim.api.nvim_feedkeys("^v$", "n", true)
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		-- Commenting depending on the context
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
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
		"rmagatti/auto-session",
		config = function()
			-- local function restore_nvim_tree()
			-- 	local nvim_tree = require("nvim-tree")
			-- 	nvim_tree.change_dir(vim.fn.getcwd())
			-- 	nvim_tree.refresh()
			-- end

			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
			vim.g.auto_session_pre_save_cmds = { "tabdo NeoTreeClose" }

			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Documents/repositories/", "~/Downloads", "~/.config" },
				auto_session_enabled = true,
				-- restore_nvim_cmds = { restore_nvim_tree },
			})
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
				margin = { 0, 35, 1, 35 },
				padding = { 0, 2, 0, 2 },
			},
			layout = {
				height = { min = 4, max = 4 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 4, -- spacing between columns
				align = "center", -- align columns left, center or right
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
