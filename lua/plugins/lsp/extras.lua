return {
	{
		"akinsho/flutter-tools.nvim",
		-- keys = {
		-- 	{ "<leader>ll", "<cmd>Telescope flutter commands<cr>", desc = "Flutter", silent = true },
		-- },
		-- keys = require("plugins.lsp.keymaps").get(),
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("flutter-tools").setup({})
			require("telescope").load_extension("flutter")
		end,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("typescript").setup({})
		end,
	},
}
