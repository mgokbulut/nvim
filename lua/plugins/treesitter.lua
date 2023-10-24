return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			-- context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"help",
				"html",
				"javascript",
				"typescript",
				"json",
				"css",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"vim",
				"yaml",
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
