-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
-- get colors for highlight groups
-- :so $VIMRUNTIME/syntax/hitest.vim

vim.opt.termguicolors = true      -- enable 24-bit RGB colors

vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
