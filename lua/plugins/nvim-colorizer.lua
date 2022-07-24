-----------------------------------------------------------
-- Colorizer configuration file
-----------------------------------------------------------

-- Plugin: nvim-colorizer
-- https://github.com/norcalli/nvim-colorizer.lua
require('colorizer').setup(
  {'*'},
  {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true
  }
)
