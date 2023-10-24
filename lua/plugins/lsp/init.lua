return {
	{
		-- lspconfig
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			},
			-- Automatically format on save
			autoformat = true,
			-- servers = {},
			-- setup = {},
			-- LSP Server Settings
			servers = {
				jsonls = {},
			},
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					-- return require("plugins.lsp.extras.setup").typescript(opts)
					require("typescript").setup({ server = opts })
					-- return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		config = function(_, opts)
			require("plugins.lsp.config").setup(opts)
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim", "jose-elias-alvarez/typescript.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.stylua,
					nls.builtins.diagnostics.flake8,
					require("typescript.extensions.null-ls.code-actions"),
				},
			}
		end,
	},

	-- cmdline tools and lsp servers
	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		-- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	-- -- Extras
	-- {
	-- 	"akinsho/flutter-tools.nvim",
	-- 	-- keys = {
	-- 	-- 	{ "<leader>ll", "<cmd>Telescope flutter commands<cr>", desc = "Flutter", silent = true },
	-- 	-- },
	-- 	-- keys = require("plugins.lsp.keymaps").get(),
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("flutter-tools").setup({})
	-- 		require("telescope").load_extension("flutter")
	-- 	end,
	-- },
	-- {
	-- 	"jose-elias-alvarez/typescript.nvim",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	config = function()
	-- 		require("typescript").setup({})
	-- 	end,
	-- },
}
