--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Version: 0.32.0 - 2021/11/08
https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('plugins/packer')
require('settings')
require('keymaps')
require('colorscheme')

require('plugins/nvim-tmux')
require('plugins/nvim-tree')
require('plugins/nvim-transparent')

-- require('plugins/indent-blankline')
require('plugins/nvim-telescope')
require('plugins/nvim-autopairs')
require('plugins/nvim-treesitter')
require('plugins/nvim-lualine-mine')
-- require('plugins/feline')
require('plugins/nvim-colorizer')
require('plugins/nvim-comment')
require('plugins/nvim-bufferline')
require('plugins/nvim-gitsigns')

require('plugins/nvim-flutter-tools')
require('plugins/nvim-lspconfig')
require('plugins/nvim-cmp')
-- require('plugins/nvim-lspsaga')
require('plugins/nvim-which-key')
require('plugins/nvim-tabout') -- needs to be after nvim-cmp
require('plugins/nvim-test') -- needs to be after nvim-cmp
