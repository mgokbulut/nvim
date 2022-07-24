-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Import colorscheme with:
--- require('colors')

local M = {}

-- Theme: monokai (classic)
--- See: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#78dce8',
  yellow = '#e6db74',
  orange = '#fa8419',
  purple = '#9c64fe',
  red = '#ed2a2a',
}

-- Theme: Rosé Pine
--- See: https://github.com/rose-pine/neovim#custom-colours
--- color names are adapted to the format above
M.rose_pine = {
  bg = '#111019',
  fg = '#e0def4',
  pink = '#eb6f92',
  green = '#1f1d2e',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  purple = '#c4a7e7',
  red = '#ebbcba',
}

M.gruvbox = {
  bg =                  '#161616',
  fg =                  '#ebdbb2',
  red =                 '#9d0006',
  green =               '#98971a',
  yellow =              '#d79921',
  blue =                '#458588',
  magenta =             '#b16286',
  cyan =                '#689d6a',
  gray =                '#a89984',
}

return M
