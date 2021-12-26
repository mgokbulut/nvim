----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Essentials
    use "aserowy/tmux.nvim"
    use 'kyazdani42/nvim-tree.lua' -- file explorer
    use 'famiu/bufdelete.nvim' -- keeping the buffer layout intact while deleting buffers
    use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
    use 'lukas-reineke/indent-blankline.nvim' -- indent line
    use 'windwp/nvim-autopairs' -- autopair
    use 'bkad/CamelCaseMotion' -- allow w to work with cammel case words
    use 'nvim-treesitter/nvim-treesitter'
    use 'numToStr/Comment.nvim'
    use 'folke/which-key.nvim'
    use 'machakann/vim-sandwich' -- surround the words e.g. saiw

    -- UI upgrades
    use 'xiyaowong/nvim-transparent'
    use 'norcalli/nvim-colorizer.lua'
    use 'szw/vim-maximizer'
    use 'nvim-lualine/lualine.nvim' -- statusline
    use 'akinsho/bufferline.nvim' -- top bar

    -- colorschemes
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'Mofiqul/dracula.nvim'
    use 'tanvirtin/monokai.nvim'
    use {'rose-pine/neovim', as = 'rose-pine'}

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Auto Completion
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind-nvim'

    -- Flutter
    use 'akinsho/flutter-tools.nvim'
    use 'Neevash/awesome-flutter-snippets'

    -- Git
    use 'lewis6991/gitsigns.nvim' -- git labels
    use 'tpope/vim-fugitive'

    use 'abecodes/tabout.nvim' -- allows tab in insert mode to move outside brackets
    use {"rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins"}

    -- Dependencies
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    if packer_bootstrap then require('packer').sync() end
end)

