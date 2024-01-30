local function expire_snippet()
	local luasnip = require('luasnip')

	local unlinkgrp = vim.api.nvim_create_augroup(
		'UnlinkSnippetOnModeChange',
		{ clear = true }
	)

	vim.api.nvim_create_autocmd('ModeChanged', {
		group = unlinkgrp,
		pattern = { 's:n', 'i:*' },
		desc = 'Forget the current snippet when leaving the insert mode',
		callback = function(evt)
			if
					luasnip.session
					and luasnip.session.current_nodes[evt.buf]
					and not luasnip.session.jump_active
			then
				luasnip.unlink_current()
			end
		end,
	})
end

local function execute_command(command)
	local keys = vim.api.nvim_replace_termcodes(command, true, true, true)
	vim.fn.feedkeys(keys, '');
end

return {
	{
		"github/copilot.vim",
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")]])
		end,
	},
	{
		-- auto completion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			'rafamadriz/friendly-snippets',

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
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "luasnip",  keyword_length = 3 },
					{ name = "buffer",   keyword_length = 3 },
					{ name = "path",     keyword_length = 3 },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
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
			}
		end,
	},
	{
		-- snippets
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"windwp/nvim-autopairs",
			"abecodes/tabout.nvim",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		version = "v2.*",
		build = "make install_jsregexp",
		keys = {
			{
				"<TAB>",
				function()
					if require("luasnip").expand_or_jumpable() then
						execute_command('<Plug>luasnip-expand-or-jump')
					else
						execute_command('<Plug>(Tabout)')
					end
				end,
				mode = { "i", "s" },
			},
			{
				"<S-TAB>",
				function()
					if require("luasnip").expand_or_jumpable() then
						execute_command('<Plug>luasnip-jump-prev')
					else
						execute_command('<Plug>(TaboutBack)')
					end
				end,
				mode = { "i", "s" },
			},
		},
		config = function(_, opts)
			expire_snippet()
		end
	},
}
