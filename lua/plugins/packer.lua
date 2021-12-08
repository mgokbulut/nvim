----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Tmux integration
  use "aserowy/tmux.nvim"

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- keeping the buffer layout intact while deleting buffers
  use 'famiu/bufdelete.nvim'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use 'windwp/nvim-autopairs'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- colorschemes
  use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
  }
  use 'Mofiqul/dracula.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- transparent background
  use'xiyaowong/nvim-transparent'

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- statusline
  use {
  'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- TODO: Get rid of it...
  -- use {
  --   'famiu/feline.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- }

  use 'machakann/vim-sandwich'
  use 'numToStr/Comment.nvim'
  use 'szw/vim-maximizer'
  use 'tpope/vim-fugitive'
  use 'folke/which-key.nvim'
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
  }

  use 'glepnir/lspsaga.nvim'


  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use 'abecodes/tabout.nvim'
  use 'vim-test/vim-test'
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

