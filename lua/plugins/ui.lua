return {
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"\\",
				function()
					require("notify").dismiss({ silent = true, pending = true })
					vim.api.nvim_feedkeys("<c-\\>", "n", true)
				end,
				silent = true,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			fps = 30,
			-- minimum_width = 50,
			-- max_width = 50,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.25)
			end,
			min_width = function()
				return math.floor(vim.o.columns * 0.25)
			end,
			stages = "fade",
		},
	},
	{
		-- Colorizer
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>sc", ":CccPick<cr>", silent = true, desc = "Color picker" },
			{ "<leader>ac", ":CccHighlighterToggle<cr>", silent = true, desc = "Color highlighing" },
		},
		opts = {
			highlighter = {
				auto_enable = true,
			},
		},
	},
	-- {
	-- 	-- active indent guide and indent text objects
	-- 	"echasnovski/mini.indentscope",
	-- 	version = false, -- wait till new 0.7.0 release to put it back on semver
	-- 	event = "BufReadPre",
	-- 	opts = {
	-- 		-- symbol = "▏",
	-- 		symbol = "│",
	-- 		options = { try_as_border = true },
	-- 	},
	-- 	config = function(_, opts)
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	-- 			callback = function()
	-- 				vim.b.miniindentscope_disable = true
	-- 			end,
	-- 		})
	-- 		require("mini.indentscope").setup(opts)
	-- 	end,
	-- },
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = "BufReadPost",
	-- 	opts = {
	-- 		char = "│",
	-- 		show_trailing_blankline_indent = false,
	-- 		show_current_context = false,
	-- 		-- show_first_indent_level = false,
	-- 		-- -- show_current_context = true,
	-- 		-- indent_blankline_show_trailing_blankline_indent = false,
	-- 		-- indent_blankline_use_treesitter = true,
	-- 		-- -- indent_blankline_show_first_indent_level = true,
	-- 		-- -- indent_blankline_show_current_context = true,
	-- 		filetype_exclude = {
	-- 			"dashboard",
	-- 			"neo-tree",
	-- 			"Trouble",
	-- 			"lazy",
	-- 			"help",
	-- 			"git",
	-- 			"markdown",
	-- 			"text",
	-- 			"terminal",
	-- 			"lspinfo",
	-- 			"packer",
	-- 			"TelescopePrompt",
	-- 		},
	-- 		buftype_exclude = {
	-- 			"terminal",
	-- 			"nofile",
	-- 		},
	-- 	},
	-- },
	{
		-- better vim.ui
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	-- {
	-- 	-- lsp loading indicator
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("fidget").setup({
	-- 			text = {
	-- 				spinner = "dots", -- animation shown when tasks are ongoing
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	-- noicer ui
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- Disable written messages
	-- 		routes = {
	-- 			{ filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
	-- 			{ view = "notify", filter = { event = "msg_showmode" } },
	-- 		},
	-- 		lsp = {
	-- 			progress = { enabled = false },
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 			},
	-- 		},
	-- 		presets = {
	-- 			command_palette = true,
	-- 			long_message_to_split = true,
	-- 		},
	-- 	},
	--    -- stylua: ignore
	--    keys = {
	--      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
	--      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
	--      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
	--      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
	--      { "<c-d>", function() if not require("noice.lsp").scroll(4) then return "<c-d>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
	--      { "<c-u>", function() if not require("noice.lsp").scroll(-4) then return "<c-u>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
	--    },
	-- },
	{
		"folke/which-key.nvim",

		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 35, 1, 35 },
				padding = { 0, 2, 0, 2 },
			},
			layout = {
				height = { min = 4, max = 4 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 4, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
			show_help = false,
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt", "alpha" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				mode = { "n", "v" },
				-- ["g"] = { name = "+goto" },
				-- ["]"] = { name = "+next" },
				-- ["["] = { name = "+prev" },
				-- ["gz"] = { name = "+surround" },
				-- ["<leader><tab>"] = { name = "+tabs" },
				-- ["<leader>b"] = { name = "+buffer" },
				-- ["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>a"] = {
					name = "+actions",
					m = { ':exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>', "Mouse support" },
				},
				["<leader>gh"] = { name = "+hunk" },
				-- ["<leader>gh"] = { name = "+hunks" },
				-- ["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>sn"] = { name = "+noice" },
				["<leader>b"] = { name = "+browse" },
				["<leader>bc"] = ":lua require('util.cheat-sheet').cht()<cr>",
				-- { ":lua require('util.cheat-sheet').cht()<cr>", desc = "Cheat sheet" },
				["<leader>r"] = { name = "+restore" },
				-- ["<leader>u"] = { name = "+ui" },
				-- ["<leader>w"] = { name = "+windows" },
				-- ["<leader>x"] = { name = "+diagnostics/quickfix" },
			})
		end,
	},
	-- {
	-- 	-- leader z to maximize window (works with tmux)
	-- 	"declancm/windex.nvim",
	-- 	lazy = true,
	-- 	keys = {
	-- 		{ "<Leader>z", "<Cmd>lua require('windex').toggle_maximize()<cr>", silent = true, desc = "Maximize" },
	-- 	},
	-- 	config = function()
	-- 		require("windex").setup({
	-- 			default_keymaps = false,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	-- auto adjust size of the buffer
	-- 	"anuvyklack/windows.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.o.winwidth = 10
	-- 		vim.o.winminwidth = 10
	-- 		vim.o.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- },
	-- {
	-- 	"gen740/SmoothCursor.nvim",
	-- 	config = function()
	-- 		require("smoothcursor").setup({
	-- 			-- cursor = "",
	-- 			-- cursor = "▷",
	-- 			texthl = "CursorLineNr", -- highlight group, default is { bg = nil, fg = "#FFD400" }
	-- 			disable_float_win = true, -- disable on float window
	-- 			fancy = {
	-- 				enable = true, -- enable fancy mode
	-- 				head = { cursor = "", texthl = "CursorLineNr", linehl = nil },
	-- 				body = {
	-- 					{ cursor = "▎", texthl = "GruvboxRed" },
	-- 					{ cursor = "▎", texthl = "GruvboxRed" },
	-- 					{ cursor = "▎", texthl = "GruvboxOrange" },
	-- 					{ cursor = "▎", texthl = "GruvboxOrange" },
	-- 					{ cursor = "▎", texthl = "GruvboxYellow" },
	-- 					{ cursor = "▎", texthl = "GruvboxYellow" },
	-- 					{ cursor = "▎", texthl = "GruvboxYellow" },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"mawkler/modicator.nvim",
	-- 	dependencies = { "ellisonleao/gruvbox.nvim" }, -- Add your colorscheme plugin here,
	-- 	init = function()
	-- 		-- These are required for Modicator to work
	-- 		vim.o.cursorline = true
	-- 		vim.o.number = true
	-- 		vim.o.termguicolors = true
	-- 	end,
	-- 	config = function()
	-- 		local colors = require("util.colors")
	-- 		require("modicator").setup({
	--
	-- 			highlights = {
	-- 				defaults = {
	-- 					foreground = colors.red,
	-- 					-- background = "#3c3836",
	-- 					bold = true,
	-- 					italic = true,
	-- 				},
	-- 				modes = {
	-- 					["n"] = { foreground = colors.red },
	-- 					["i"] = { foreground = colors.green },
	-- 					["v"] = { foreground = colors.blue },
	-- 					["V"] = { foreground = colors.blue },
	-- 					["�"] = { foreground = colors.blue },
	-- 					["s"] = { foreground = colors.orange },
	-- 					["S"] = { foreground = colors.orange },
	-- 					["R"] = { foreground = colors.gray },
	-- 					["c"] = { foreground = colors.red },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	lazy = true,
	-- 	init = function()
	-- 		vim.g.navic_silence = true
	-- 	end,
	-- 	opts = function()
	-- 		return {
	-- 			separator = "  ",
	-- 			highlight = true,
	-- 			depth_limit = 5,
	-- 			icons = require("util.icons").kinds,
	-- 		}
	-- 	end,
	-- },
	{
		-- statusline
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(plugin)
			local colors = require("util.colors")

			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				[""] = colors.blue,
				V = colors.blue,
				c = colors.red,
				no = colors.red,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.gray,
				Rv = colors.gray,
				cv = colors.red,
				ce = colors.red,
				r = colors.aqua,
				rm = colors.aqua,
				["r?"] = colors.aqua,
				["!"] = colors.red,
				t = colors.red,
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			local defaultOpts = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.darkgray } },
					inactive = { c = { fg = colors.fg, bg = colors.darkgray } },
					active = { c = { fg = colors.fg, bg = colors.darkgray } },
				},
				disabled_filetypes = {
					statusline = { "alpha" },
				},
			}

			local defaultConfig = {
				options = defaultOpts,
				sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local function insertText(str)
				return function()
					return str
				end
			end

			local neotree = {
				options = defaultOpts,
				sections = { lualine_c = { { insertText("  File tree ") } } },
				filetypes = { "neo-tree" },
			}

			local quickfix = {
				options = defaultOpts,
				sections = { lualine_c = { { insertText("🚦 Quickfix  ") } } },
				filetypes = { "qf", "Trouble" },
			}

			-- Config
			local config = defaultConfig
			config.extensions = { neotree, quickfix }

			-- Inserts a component in lualine_c at left section
			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			-- Inserts a component in lualine_x ot right section
			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			local function get_mode_color()
				return function()
					return { fg = mode_color[vim.fn.mode()] }
				end
			end

			-- Left side
			ins_left({ insertText("▊    "), color = get_mode_color(), padding = { left = 0 } })
			ins_left({ "filesize", cond = conditions.buffer_not_empty })
			ins_left({ "branch", icon = "", color = { fg = colors.orange, gui = "italic" } })
			ins_left({ "filetype", icon_only = true, separator = "" })
			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.purple, gui = "italic" },
				path = 1,
				symbols = { modified = " ", readonly = " ", unnamed = " " },
				padding = { right = 2 },
			})
			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.aqua },
				},
			})
			-- ins_left({
			-- 	function()
			-- 		return require("nvim-navic").get_location()
			-- 	end,
			-- 	cond = function()
			-- 		return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
			-- 	end,
			-- 	padding = { left = 6 },
			-- })

			-- Right side
			ins_right({
				"diff",
				symbols = { added = " ", modified = "柳 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})
			ins_right({
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					-- Potentially, lsp exists
					msg = ""
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							msg = msg .. client.name .. ", "
						end
					end

					return msg:sub(0, string.len(msg) - 2)
				end,
				icon = " LSP:",
				color = { gui = "italic" },
			})
			ins_right({ "progress", color = { fg = "#ffffff", gui = "italic" } })
			ins_right({ insertText("▊"), color = get_mode_color(), padding = { left = 1 } })

			return config
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<A-L>", ":BufferLineMoveNext<cr>", silent = true },
			{ "<A-H>", ":BufferLineMovePrev<cr>", silent = true },
			{ "<leader><tab>", ":BufferLineCycleNext<cr>", silent = true, desc = "Next buffer" },
			{ "<leader><s-tab>", ":BufferLineCyclePrev<cr>", silent = true, desc = "Prev buffer" },
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("util.icons").diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local leader = "SPC "

			local function button(sc, txt, leader_txt, keybind, keybind_opts)
				local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

				local opts = {
					position = "center",
					shortcut = sc,
					cursor = 5,
					width = 50,
					align_shortcut = "right",
					hl_shortcut = "Keyword",
				}

				if nil == keybind then
					keybind = sc_after
				end
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_after, keybind, keybind_opts }

				local function on_press()
					-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
					local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
					vim.api.nvim_feedkeys(key, "t", false)
				end

				return {
					type = "button",
					val = txt,
					on_press = on_press,
					opts = opts,
				}
			end

			local dashboard = require("alpha.themes.dashboard")

			-- terminal
			dashboard.section.cmatrix = {
				type = "terminal",
				-- command = "tty-clock -sc",
				command = "cmatrix",
				-- width = 100,
				-- height = 8,
				opts = {
					redraw = true,
					window_config = {
						zindex = 6,
						relative = "win",
						anchor = "NW",
					},
				},
			}

			dashboard.section.clock = {
				type = "terminal",
				command = "tty-clock -s",
				-- command = "cmatrix",
				width = 57,
				height = 8,
				opts = {
					redraw = true,
					window_config = {
						zindex = 7,
						relative = "win",
						anchor = "NW",
					},
				},
			}

			-- greeting
			local userName = "Mr.Gokbulut"
			local greeting = require("util.functions").getGreeting(userName)

			dashboard.section.greetHeading =
				{ type = "text", val = greeting, opts = { position = "center", hl = "String" } }
			-- dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				button(leader .. "r r", "  Restore Session", leader, ':lua require("persistence").load() <cr>'),
				button(leader .. "f f", "  Find file", leader, ":Telescope find_files <CR>"),
				button(leader .. "f s", "  Find text", leader, ":Telescope live_grep <CR>"),
				button(leader .. "f p", "  Find project", leader, ":Telescope projects <CR>"),
				button(leader .. "f r", "  Recent files", leader, ":Telescope oldfiles <CR>"),
				button("n  ", "ﱐ  New file", leader, ":ene <BAR> startinsert <CR>"),
				button("c  ", "  Config", leader, ":e ~/.config/nvim/init.lua <CR>"),
				button("q  ", " " .. " Quit", leader, ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			-- dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.clock.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8

			-- ┌──────────────────────────────────────────────────────────┐
			-- │                  /                                       │
			-- │    header_padding                                        │
			-- │                  \  ┌──────────────┐ ____                │
			-- │                     │    header    │     \               │
			-- │                  /  └──────────────┘      \              │
			-- │ head_butt_padding                          \             │
			-- │                  \                          occu_        │
			-- │                  ┌────────────────────┐     height       │
			-- │                  │       button       │    /             │
			-- │                  │       button       │   /              │
			-- │                  │       button       │  /               │
			-- │                  └────────────────────┘‾‾                │
			-- │                  /                                       │
			-- │ foot_butt_padding                                        │
			-- │                  \  ┌──────────────┐                     │
			-- │                     │    footer    │                     │
			-- │                     └──────────────┘                     │
			-- │                                                          │
			-- └──────────────────────────────────────────────────────────┘

			local head_butt_padding = 4
			local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
			local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.75))
			local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val - 3
			local foot_butt_padding = math.floor((vim.fn.winheight("$") - 2 * header_padding - occu_height))
			foot_butt_padding = math.max(
				0,
				math.max(math.min(0, foot_butt_padding), math.min(math.max(0, foot_butt_padding), foot_butt_padding_ub))
			) + 1

			local stats = vim.api.nvim_list_uis()[1]
			local width = stats.width
			-- local height = stats.height
			dashboard.section.cmatrix.opts.window_config.row = 2
			dashboard.section.cmatrix.height = header_padding
			dashboard.section.cmatrix.width = math.floor(width * 0.6)
			dashboard.section.clock.opts.window_config.row = (header_padding / 2) - 4 + 2

			dashboard.config.layout = {
				-- { type = "padding", val = header_padding },
				-- dashboard.section.header,
				{ type = "padding", val = header_padding },
				-- dashboard.section.clock,
				-- dashboard.section.cmatrix,
				{ type = "padding", val = head_butt_padding },
				dashboard.section.greetHeading,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = foot_butt_padding },
				dashboard.section.footer,
			}

			-- alpha.setup(dashboard.opts)
			require("alpha.term")
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
