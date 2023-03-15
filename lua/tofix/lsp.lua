local lsp = require("lsp-zero")
-- presets
-- lsp.preset('lsp-only')
lsp.preset("recommended")
lsp.nvim_workspace()

lsp.setup()

-- local diagnosticGroups = {"DiagnosticSignError","DiagnosticSignWarn","DiagnosticSignInfo","DiagnosticSignHint"}
-- local diagnosticGroups = {"DiagnosticError", "DiagnosticWarn","DiagnosticInfo","DiagnosticHint","DiagnosticUnderlineError","DiagnosticUnderlineWarn","DiagnosticUnderlineInfo","DiagnosticUnderlineHint","DiagnosticVirtualTextError","DiagnosticVirtualTextWarn","DiagnosticVirtualTextInfo","DiagnosticVirtualTextHint","DiagnosticFloatingError","DiagnosticFloatingWarn","DiagnosticFloatingInfo","DiagnosticFloatingHint","DiagnosticSignError","DiagnosticSignWarn","DiagnosticSignInfo","DiagnosticSignHint"}

local diagnosticGroups = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" }
for k, v in pairs(diagnosticGroups) do
	local fn = vim.fn
	local fg = fn["synIDattr"](fn["synIDtrans"](fn["hlID"](v)), "fg" .. "#")
	vim.cmd(":hi " .. v .. " guifg=" .. fg .. " guibg=None")
end

-- local cmp = require("cmp")
-- local types = require("cmp.types")
-- local str = require("cmp.utils.str")
-- local luasnip = require("luasnip")
-- local lspkind = require("lspkind")
-- local neogen = require("neogen")
--
-- local t = function(str)
-- 	return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
--
-- -- Do not jump to snippet if i'm outside of it
-- -- https://github.com/L3MON4D3/LuaSnip/issues/78
-- -- luasnip.config.setup({
-- -- 	region_check_events = "CursorMoved",
-- -- 	delete_check_events = "TextChanged",
-- -- })
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
--   formatting = {
--     fields = { "kind", "abbr", "menu" },
--     format = function(entry, vim_item)
--       local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
--       local strings = vim.split(kind.kind, "%s", { trimempty = true })
--       kind.kind = " " .. (strings[1] or "") .. " "
--       kind.menu = "    (" .. (strings[2] or "") .. ")"
--
--       return kind
--     end,
--   },
-- 	window = {
-- 		completion = {
--       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
--       side_padding = 0,
--       col_offset = -3,
--     },
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	experimental = {
-- 		ghost_text = true,
-- 		native_menu = false, -- TODO: see if you like this better
-- 	},
-- 	mapping = {
-- 		["<C-k>"] = cmp.mapping.select_prev_item(),
-- 		["<C-j>"] = cmp.mapping.select_next_item(),
-- 		["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-u>"] = cmp.mapping.scroll_docs(4),
-- 		-- ["<C-Space>"] = cmp.mapping.complete(),
-- 		["<CR>"] = cmp.mapping.complete(),
--     ['<TAB>'] = cmp.mapping(function(fallback)
--       if luasnip.jumpable(1) then
--         luasnip.jump(1)
--       else
--         fallback()
--       end
--     end, {'i', 's'}),
--     ['<S-TAB>'] = cmp.mapping(function(fallback)
--       if luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, {'i', 's'}),
-- 	},
-- 	sources = {
-- 		{ name = "cmp_git" },
-- 		{ name = "path" },
-- 		{ name = "luasnip" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "buffer", keyword_length = 3, max_item_count = 3 },
-- 	},
-- })
--
-- local function get_color(group, attr)
--     return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
-- end
-- function get_hl(name)
--         local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
--         if not ok then
--             return
--         end
--         for _, key in pairs({"foreground", "background", "special"}) do
--             if hl[key] then
--                 hl[key] = string.format("#%06x", hl[key])
--             end
--         end
--         return hl
--
-- end
--
-- -- local result = table.concat(get_hl("Pmenu"), ", ")
-- -- print(get_hl("Pmenu"))
-- -- print(get_color("Pmenu", "bg#"))
