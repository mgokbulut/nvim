-----	------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

--[[ require("nvim-treesitter.configs").setup({ ]]
--[[ 	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages ]]
--[[ 	-- sync_install = false, -- install languages synchronously (only applied to `ensure_installed`) ]]
--[[ 	-- -- ignore_install = { "latex", "llvm", }, -- List of parsers to ignore installing ]]
--[[ 	autopairs = { ]]
--[[ 		enable = true, ]]
--[[ 	}, ]]
--[[ 	highlight = { ]]
--[[ 		enable = true, -- false will disable the whole extension ]]
--[[ 		-- disable = { "" }, -- list of language that will be disabled ]]
--[[ 		-- additional_vim_regex_highlighting = true, ]]
--[[ 	}, ]]
--[[ 	indent = { enable = true, disable = { "yaml" } }, ]]
--[[ 	context_commentstring = { ]]
--[[ 		enable = true, ]]
--[[ 		enable_autocmd = false, ]]
--[[ 	}, ]]
--[[ }) ]]

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = "all",

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	},
})
