require('indent_blankline').setup {
  char = "▏",
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'TelescopePrompt',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
}
