-- require("git-worktree").setup({
--     change_directory_command = "cd", -- default: "cd",
--     update_on_change = true, -- default: true,
--     update_on_change_command = '<cmd>lua require("telescope.builtin").find_files()<cr>', -- default: "e .",
--     clearjumps_on_change = true, -- default: true,
--     autopush = false -- default: false,
-- })
require("git-worktree").setup()

require("telescope").load_extension("git_worktree")
