return {
	{ "lewis6991/impatient.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	-- popup support
	{ "MunifTanjim/nui.nvim" },
	{
		-- icon picker
		"ziontee113/icon-picker.nvim",
		keys = {
			{ "<Leader>si", "<cmd>IconPickerNormal<cr>", silent = true, desc = "Icon picker" },
		},
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>rr", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>rd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
	},
	-- makes some plugins dot-repeatable like leap
	{ "tpope/vim-repeat", event = "VeryLazy" },
}
