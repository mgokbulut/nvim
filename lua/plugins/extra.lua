return {
	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = {
				enable = false,
			},
			navigation = {
				enable_default_keybindings = true,
			},
			resize = {
				enable_default_keybindings = true,
			},
		},
	},
	{
		-- better navigation
		-- TODO: setup keybindings
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

			-- vim.api.nvim_set_keymap(
			-- 	"n",
			-- 	"<leader>fp",
			-- 	":lua require'telescope'.extensions.projects.projects{}<cr>",
			-- 	{ nnoremap = true, silent = true }
			-- )
		end,
	},
}
