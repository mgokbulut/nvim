-----------------------------------------------------------
-- Autopairs configuration file
-----------------------------------------------------------

-- Plugin: nvim-autopairs
-- https://github.com/windwp/nvim-autopairs

require('nvim-autopairs').setup {
  disable_filetype = { "TelescopePrompt" , "vim" },
  disable_in_macro = true,
  -- map_cr = true, -- TODO: Remove this when you configure nvim-cmp
}
