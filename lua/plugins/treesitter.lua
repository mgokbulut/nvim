return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = "BufReadPost",
		-- keys = {
		-- 	{ "<c-space>", desc = "Increment selection" },
		-- 	{ "<bs>", desc = "Schrink selection", mode = "x" },
		-- },
		---@type TSConfig
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"help",
				"html",
				"javascript",
				"json",
				"css",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "<C-space>",
			-- 		node_incremental = "<C-space>",
			-- 		scope_incremental = "<nop>",
			-- 		node_decremental = "<bs>",
			-- 	},
			-- },
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- {
	-- 	"tree-sitter/tree-sitter-css",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
	-- {
	-- 	"mskelton/tree-sitter-styled",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"tree-sitter/tree-sitter-css",
	-- 	},
	-- },
}

-- return {
--   'nvim-treesitter/nvim-treesitter',
--   build = function ()
--     pcall(require('nvim-treesitter.install').update {with_sync = true})
--   end,
--   dependencies = {
--     'nvim-treesitter/nvim-treesitter-textobjects',
--   },
--   config = {
--     -- A list of parser names, or "all"
--     ensure_installed = { "c", "lua", "rust", "help", "javascript", "typescript", "go", "java", "kotlin", "json", "yaml" },
--
--     -- Install parsers synchronously (only applied to `ensure_installed`)
--     sync_install = false,
--
--     -- Automatically install missing parsers when entering buffer
--     -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--     auto_install = true,
--
--     -- List of parsers to ignore installing (for "all")
--     -- ignore_install = { "javascript" },
--
--     ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--     -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
--
--     highlight = {
--       -- `false` will disable the whole extension
--       enable = true,
--       additional_vim_regex_highlighting = false,
--     },
--
--     textobjects = {
--       select = {
--         enable = true,
--
--         -- Automatically jump forward to textobj, similar to targets.vim
--         lookahead = true,
--
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ["af"] = { query = "@function.outer", desc = "arround function" },
--           ["if"] = { query = "@function.inner", desc = "inner function" },
--           ["ac"] = { query = "@class.outer",    desc = "arround class" },
--           ["ic"] = { query = "@class.inner",    desc = "inner class" },
--           ["al"] = { query = "@loop.outer",    desc = "arround loop" },
--           ["il"] = { query = "@loop.inner",    desc = "inner loop" },
--           ["ab"] = { query = "@block.outer",    desc = "arround block" },
--           ["ib"] = { query = "@block.inner",    desc = "inner block" },
--
--           -- You can optionally set descriptions to the mappings (used in the desc parameter of
--           -- nvim_buf_set_keymap) which plugins like which-key display
--         },
--         -- You can choose the select mode (default is charwise 'v')
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * method: eg 'v' or 'o'
--         -- and should return the mode ('v', 'V', or '<c-v>') or a table
--         -- mapping query_strings to modes.
--         selection_modes = {
--           ['@parameter.outer'] = 'v', -- charwise
--           ['@function.outer'] = 'V', -- linewise
--           ['@class.outer'] = '<c-v>', -- blockwise
--         },
--         -- If you set this to `true` (default is `false`) then any textobject is
--         -- extended to include preceding or succeeding whitespace. Succeeding
--         -- whitespace has priority in order to act similarly to eg the built-in
--         -- `ap`.
--         --
--         -- Can also be a function which gets passed a table with the keys
--         -- * query_string: eg '@function.inner'
--         -- * selection_mode: eg 'v'
--         -- and should return true of false
--         include_surrounding_whitespace = true,
--       },
--       move = {
--         enable = true,
--         set_jumps = true, -- whether to set jumps in the jumplist
--         goto_next_start = {
--           ["]m"] = "@function.outer",
--           ["]]"] = { query = "@class.outer", desc = "Next class start" },
--         },
--         goto_next_end = {
--           ["]M"] = "@function.outer",
--           ["]["] = "@class.outer",
--         },
--         goto_previous_start = {
--           ["[m"] = "@function.outer",
--           ["[["] = "@class.outer",
--         },
--         goto_previous_end = {
--           ["[M"] = "@function.outer",
--           ["[]"] = "@class.outer",
--         },
--       },
--       swap = {
--         enable = true,
--         swap_next = {
--           ["<C-n>"] = "@parameter.inner",
--         },
--         swap_previous = {
--           ["<C-p>"] = "@parameter.inner",
--         },
--       },
--     },
--
--     indent = {
--       enable = true
--     },
--   },
-- }

-- vim.cmd('set foldmethod=expr')
-- vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
