local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Essentials
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("aserowy/tmux.nvim")
	use("tpope/vim-obsession")
	use("kyazdani42/nvim-tree.lua") -- file explorer
	use("famiu/bufdelete.nvim") -- keeping the buffer layout intact while deleting buffers
	use("nvim-telescope/telescope.nvim") -- Fuzzy finder
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("lukas-reineke/indent-blankline.nvim") -- indent line
	use("windwp/nvim-autopairs") -- autopair
	use("bkad/CamelCaseMotion") -- allow w to work with cammel case words
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- comment different filetypes within same buffer
	use("folke/which-key.nvim")
	use("machakann/vim-sandwich") -- surround the words e.g. saiw
	use("fadein/vim-FIGlet")
	-- use 'vimpostor/vim-tpipeline'

	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("akinsho/toggleterm.nvim")
	use("ThePrimeagen/git-worktree.nvim")

	-- UI upgrades
	use("xiyaowong/nvim-transparent")
	use("norcalli/nvim-colorizer.lua")
	use("szw/vim-maximizer")
	use("windwp/windline.nvim")
	-- use 'nvim-lualine/lualine.nvim' -- statusline
	use("noib3/nvim-cokeline") -- alternative topbar
	use("akinsho/bufferline.nvim") -- top bar

	-- Colorschemes
	-- use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
	--[[ use({ "mgokbulut/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }) ]]
	use("ellisonleao/gruvbox.nvim")
	use("Mofiqul/dracula.nvim")
	use("tanvirtin/monokai.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	-- use("windwp/lsp-fastaction.nvim")
	use("weilbith/nvim-code-action-menu")
	use("ray-x/lsp_signature.nvim")
	use("nikvdp/ejs-syntax")

	-- Flutter
	use("akinsho/flutter-tools.nvim")
	use("Neevash/awesome-flutter-snippets")
	use("SirVer/Ultisnips")
	use("natebosch/dartlang-snippets")
	use("mgokbulut/dart-snippets")

	-- Auto Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Git
	use("lewis6991/gitsigns.nvim") -- git labels
	use("tpope/vim-fugitive")

	-- use("abecodes/tabout.nvim") -- allows tab in insert mode to move outside brackets
	-- use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

	-- Dependencies
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Nvim inside chrome
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use("scalameta/nvim-metals")
	use({ "raghur/vim-ghost", run = ":GhostInstall" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
