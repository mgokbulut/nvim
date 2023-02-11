--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

require("plugins.packer")
require("options")
require("keymaps")
require("colorscheme")

require("plugins.nvim-tmux")
require("plugins.nvim-tree")
require("plugins.nvim-transparent")

require("plugins.nvim-telescope")
require("plugins.nvim-autopairs")
require("plugins.nvim-wildline")
-- require('plugins.nvim-lualine-mine')
require("plugins.nvim-indent-blankline")
require("plugins.nvim-colorizer")
require("plugins.nvim-comment")
require("plugins.nvim-bufferline")
-- require("plugins.nvim-cokeline")
-- require("plugins.nvim-gitsigns")
-- require("plugins.nvim-tabout") -- needs to be after nvim-cmp
-- require("plugins.nvim-lsp-fastaction")
require("plugins.nvim-codeaction-menu")

require("plugins.nvim-projects")
require("plugins.nvim-git-worktree")
require("plugins.nvim-alpha")
require("plugins.nvim-impatient")

-- require('plugins.nvim-flutter-tools')
-- require('plugins.nvim-flutter-guides')
require("plugins.lsp")
-- require('plugins.lsp_config.nvim-lspconfig')
require("plugins.nvim-cmp")
require("plugins.nvim-which-key")
require("plugins.nvim-toggleterm")
-- require("plugins.nvim-test") -- needs to be after nvim-cmp

require("plugins.nvim-treesitter")

----------------------------------
-- LSP Setup ---------------------
----------------------------------
-- metals_config = require("metals").bare_config()
--
-- -- Example of settings
-- metals_config.settings = {
-- 	showImplicitArguments = true,
-- 	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
-- 	serverVersion = "0.10.9+133-9aae968a-SNAPSHOT",
-- }

-- -- *READ THIS*
-- -- I *highly* recommend setting statusBarProvider to true, however if you do,
-- -- you *have* to have a setting to display this in your statusline or else
-- -- you'll not see any messages from metals. There is more info in the help
-- -- docs about this
-- -- metals_config.init_options.statusBarProvider = "on"
--
-- -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
--
-- metals_config.on_attach = require("plugins.lsp.handlers").on_attach
-- metals_config.capabilities = require("plugins.lsp.handlers").capabilities
-- -- require("plugins.lsp.handlers").setup()
--
-- metals_config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- })
--
-- metals_config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 	border = "rounded",
-- })
--
-- local signs = {
-- 	{ name = "DiagnosticSignError", text = "" },
-- 	{ name = "DiagnosticSignWarn", text = "" },
-- 	{ name = "DiagnosticSignHint", text = "" },
-- 	{ name = "DiagnosticSignInfo", text = "" },
-- }
--
-- local config = {
-- 	-- disable virtual text
-- 	virtual_text = true,
-- 	-- show signs
-- 	signs = {
-- 		active = signs,
-- 	},
-- 	update_in_insert = false,
-- 	underline = false,
-- 	severity_sort = true,
-- 	float = {
-- 		focusable = false,
-- 		style = "minimal",
-- 		border = "rounded",
-- 		source = "always",
-- 		header = "",
-- 		prefix = "",
-- 	},
-- }
--
-- -- metals_config.handlers["textDocument/publishDiagnostics"] = vim.diagnostic.config(config)
--
-- -- metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- -- 	vim.lsp.diagnostic.on_publish_diagnostics,
-- -- 	config
-- -- )
--
-- vim.cmd([[augroup lsp]])
-- vim.cmd([[autocmd!]])
-- vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
-- -- NOTE: You may or may not want java included here. You will need it if you want basic Java support
-- -- but it may also conflict if you are using something like nvim-jdtls which also works on a java filetype
-- -- autocmd.
-- vim.cmd([[autocmd FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
-- vim.cmd([[augroup end]])
-- vim.cmd([[
-- function! s:SetupGhostBuffer()
--     if match(expand("%:a"), '\v/ghost-(github|reddit)\.com-')
--         set ft=scala
--     endif
-- endfunction
--
-- augroup vim-ghost
--     au!
--     au User vim-ghost#connected call s:SetupGhostBuffer()
-- augroup END
-- ]])
