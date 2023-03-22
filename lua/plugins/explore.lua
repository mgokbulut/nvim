return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			-- <cmd>lua require("telescope.builtin").find_files()<cr>
			{
				"<leader>ff",
				"<cmd>Telescope find_files hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find file",
			},
			{
				"<leader>fg",
				"<cmd>Telescope git_files hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find git file",
			},
			{
				"<leader>fs",
				"<cmd>Telescope live_grep hidden=true<cr>",
				noremap = true,
				silent = true,
				desc = "Find grep",
			},
			-- {
			-- 	"<leader>fs",
			-- 	"<cmd>Telescope grep_string hidden=true<cr>",
			-- 	noremap = true,
			-- 	silent = true,
			-- 	desc = "Find grep",
			-- },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", noremap = true, silent = true, desc = "Find buffer" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", noremap = true, silent = true, desc = "Find help" },
			{ "<leader>fr", "<cmd>Telescope resume<cr>", noremap = true, silent = true, desc = "Find resume" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", noremap = true, silent = true, desc = "Find resume" },
			{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
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
							["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
						},
						n = {
							["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
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

			require("telescope").load_extension("ui-select")
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
				position = "right", -- left, right, top, bottom, float, current
				width = 40, -- applies to left and right positions
				height = 15, -- applies to top and bottom positions
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
				filtered_items = {
					visible = true, -- when true, they will just be displayed differently than normal items
					force_visible_in_empty_folder = true, -- when true, hidden files will be shown if the root folder is otherwise empty
					show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
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
	{
		-- edit file and folder names
		"elihunter173/dirbuf.nvim",
		lazy = true,
		keys = {
			{ "<leader>ae", ":lua require('util.functions').popup('Dirbuf')<cr>", noremap = true, desc = "Bulk edit" },
		},
		config = function()
			require("dirbuf").setup({
				hash_padding = 2,
				show_hidden = true,
				sort_order = "default",
				write_cmd = "DirbufSync -confirm",
			})
		end,
	},
	{
		-- search/replace in multiple files
		"windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Find and Replace (Spectre)" },
    },
	},
}
