return {
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		cmd = "NodeAction",
		keys = {
			{ "gn", ":NodeAction<cr>", desc = "node action", silent = true },
		},
		config = function()
			require("ts-node-action").setup()
		end,
	},
	{
		"rareitems/printer.nvim",
		keys = {
			{ "gP", "<Plug>(printer_print)iw", desc = "print variable", silent = true },
			{ "gp", "<Plug>(printer_print)", desc = "print", silent = true },
		},
		opts = {
			keymap = "gp",
			add_to_inside = function(text)
				return string.format("%s", text)
			end,
		},
	},
	-- {
	-- 	-- auto pairs
	-- 	"echasnovski/mini.pairs",
	-- 	event = "VeryLazy",
	-- 	config = function(_, opts)
	-- 		require("mini.pairs").setup(opts)
	-- 	end,
	-- },
	{
		-- snippets
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
	},
	{
		-- auto completion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", keyword_length = 1 },
					{ name = "luasnip", keyword_length = 1 },
					{ name = "buffer", keyword_length = 1 },
					{ name = "path", keyword_length = 1 },
				}),

				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind =
							require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    ▎ " .. (strings[2] or "")

						return kind
					end,
				},
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						side_padding = 0,
						col_offset = -3,
					},
					documentation = cmp.config.window.bordered(),
				},
				-- formatting = {
				--   format = function(_, item)
				--     local icons = require("lazyvim.config").icons.kinds
				--     if icons[item.kind] then
				--       item.kind = icons[item.kind] .. item.kind
				--     end
				--     return item
				--   end,
				-- },
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
						ghost_text = true,
					},
				},
			}
		end,
	},
	{
		"echasnovski/mini.ai",
		-- keys = {
		--   { "a", mode = { "x", "o" } },
		--   { "i", mode = { "x", "o" } },
		-- },
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- no need to load the plugin, since we only need its queries
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end,
			},
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			local ai = require("mini.ai")
			ai.setup(opts)
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		-- illuminate references of the same variable
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
					pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
				end,
			})
		end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
	},
	{
		-- better diagnostics list and others
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			position = "bottom",
			height = 15, -- width of the list when position is left or right
			use_diagnostic_signs = true,
		},
		keys = {
			{ "<leader>lD", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics" },
			{ "<leader>ld", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
		},
	},
	-- {
	-- 	-- todo comments
	-- 	"folke/todo-comments.nvim",
	-- 	cmd = { "TodoTrouble", "TodoTelescope" },
	-- 	event = "BufReadPost",
	-- 	config = true,
	--    -- stylua: ignore
	--    keys = {
	--      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
	--      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
	--      { "<leader>st", "<cmd>TodoTrouble<cr>", desc = "Todo's" },
	--      { "<leader>sT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
	--      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo's" },
	--    },
	-- },
	{
		-- code documentation
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		lazy = true,
		keys = {
			{ "<Leader>lc", ":lua require('neogen').generate()<CR>", silent = true, desc = "Generate documentation" },
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		config = function(_, opts)
			require("refactoring").setup(opts)
			require("telescope").load_extension("refactoring")
		end,
    -- stylua: ignore
    keys = { 
      { "<leader>lf", function() require("telescope").extensions.refactoring.refactors() end, mode = { "v" }, desc = "Refactor", },
    },
	},
}
