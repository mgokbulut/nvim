local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_git_hl = 0 -- git files colored ~ gets confusing for me
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
vim.g.nvim_tree_refresh_wait = 200 -- faster refresh
vim.g.nvim_tree_window_picker_exclude = {
   filetype = { 'notify', 'packer', 'qf' },
   buftype = {'terminal' },
}

vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "",
      unstaged = "",
      untracked = "",
      unmerged = "",
   },
--    folder = {
--       -- arrow_open = "",
--       -- arrow_closed = "",
--       default = "",
--       empty = "", -- 
--       empty_open = "",
--       open = "",
--       symlink = "",
--       symlink_open = "",
--    },
}

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
  view = {
    allow_resize = true,
    auto_resize = true,
    side = "left",
    width = 35,
    mappings = {
      custom_only = true,
      list = {
        { key = {"o", "<2-LeftMouse>"},         cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "<CR>",                         cb = tree_cb("cd") },
        { key = "<BS>",                         cb = tree_cb("dir_up") },
        { key = "l",                            cb = tree_cb("edit") },
        { key = "h",                            cb = tree_cb("close_node") },
        { key = "v",                            cb = tree_cb("vsplit") },
        { key = "s",                            cb = tree_cb("split") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = "i",                            cb = tree_cb("toggle_dotfiles") },
        { key = "H",                            cb = tree_cb("toggle_help") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "e",                            cb = tree_cb("close") },
        { key = "f",                            cb = ":!open .<cr>"},
      }
    }
  },
}
