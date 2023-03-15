return {
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
}
