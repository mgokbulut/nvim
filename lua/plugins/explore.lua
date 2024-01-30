-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == '' then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ':h')
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
	if vim.v.shell_error ~= 0 then
		print 'Not a git repository. Searching on current working directory'
		return cwd
	end
	return git_root
end

-- Custom find_files function to search in git root
local function find_files_git_root()
	local git_root = find_git_root()
	if git_root then
		require('telescope.builtin').find_files {
			search_dirs = { git_root },
		}
	end
end

vim.api.nvim_create_user_command('FindFilesGitRoot', find_files_git_root, {})

-- Custom live_grep function to search in git root
local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require('telescope.builtin').live_grep {
			search_dirs = { git_root },
		}
	end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local function search_in_buffer()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end

vim.api.nvim_create_user_command('SearchInBuffer', search_in_buffer, {})

return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{
				"<leader>ff",
				"<cmd>FindFilesGitRoot<cr>",
				noremap = true,
				silent = true,
				desc = "Find file (Git root)",
			},
			{
				"<leader>fs",
				"<cmd>LiveGrepGitRoot<cr>",
				noremap = true,
				silent = true,
				desc = "Find grep (Git root)",
			},
			{
				"<leader>fF",
				"<cmd>Telescope find_files hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find file",
			},
			{
				"<leader>fS",
				"<cmd>Telescope live_grep hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find grep",
			},
			{
				"<leader>fg",
				"<cmd>Telescope git_files hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find git file",
			},
			{ "<leader><space>", "<cmd>Telescope buffers<cr>",   noremap = true,    silent = true, desc = "Find buffer" },
			{ "<leader>/",       "<cmd>SearchInBuffer<cr>",      noremap = true,    silent = true, desc = "Search in buffer" },
			{ "<leader>fh",      "<cmd>Telescope help_tags<cr>", noremap = true,    silent = true, desc = "Find help" },
			{ "<leader>fr",      "<cmd>Telescope resume<cr>",    noremap = true,    silent = true, desc = "Find resume" },
			{ "<leader>fr",      "<cmd>Telescope oldfiles<cr>",  noremap = true,    silent = true, desc = "Find resume" },
			{ "<leader>fm",      "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
		},
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		config = function(_, opts)
			require("telescope").setup({
				defaults = {
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					prompt_prefix = " 🔭 ",
					hidden = true,
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
					file_ignore_patterns = {
						"vendor",
						"out",
						"android",
						"ios",
						"docs",
						"web",
						".git/",
						"node_modules",
						"__snapshots_-",
					},
					pickers = {
						live_grep = {
							only_sort_text = true,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require('telescope').load_extension, 'fzf')
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v2.x",
		lazy = false,
		keys = {
			{ "<leader>e", ":NeoTreeFocus<CR>", desc = "File tree focus", silent = true },
			-- { "E", ":NeoTreeShowToggle<CR>", desc = "File tree toggle", silent = true },
		},
		opts = {
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			close_floats_on_escape_key = false,
			enable_diagnostics = true,
			enable_git_status = true,
			enable_modified_markers = true, -- Show markers for files with unsaved changes.
			git_status_async = true,
			log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
			source_selector = {
				winbar = false, -- toggle to show selector on winbar
				statusline = false, -- toggle to show selector on statusline
				truncation_character = "…", -- character to use when truncating the tab label
			},
			default_component_configs = {
				modified = {
					symbol = " ",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- NOTE: you can set any of these to an empty string to not show them
						deleted = "✖",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
					align = "right",
				},
			},
			window = {
				position = "left",     -- left, right, top, bottom, float, current
				width = 40,            -- applies to left and right positions
				height = 15,           -- applies to top and bottom positions
				auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
				mappings = {
					["<cr>"] = "open",
					["l"] = "open",
					["h"] = "close_node",
					["s"] = "open_vsplit",
					["v"] = "open_split",
				},
			},
			filesystem = {
				-- bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
				-- cwd_target = {
				--   sidebar = "tab",   -- sidebar is when position = left or right
				--   current = "window" -- current is when position = current
				-- },
				filtered_items = {
					visible = true,                  -- when true, they will just be displayed differently than normal items
					force_visible_in_empty_folder = true, -- when true, hidden files will be shown if the root folder is otherwise empty
					show_hidden_count = true,        -- when true, the number of hidden items in each folder will be shown as the last entry
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
					hide_by_name = {},
				},
				follow_current_file = true,
				use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
				-- instead of relying on nvim autocmd events.
			},
			buffers = {
				group_empty_dirs = false, -- when true, empty directories will be grouped together
			},
		},
	},
}
