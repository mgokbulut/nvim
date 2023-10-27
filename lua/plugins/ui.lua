return {
	{
		-- statusline
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"Mofiqul/dracula.nvim",
		},
		opts = function(plugin)
			local colors = require("dracula").colors()
			-- local colors = require("util.colors")
			--
			local mode_color = {
				n = colors.bright_blue,
				i = colors.bright_green,
				v = colors.cyan, -- blue
				V = colors.cyan, -- blue
				[""] = colors.cyan, -- blue
				-- c = colors.red,
				-- no = colors.red,
				-- s = colors.orange,
				-- S = colors.orange,
				-- [""] = colors.orange,
				-- ic = colors.yellow,
				-- R = colors.gray,
				-- Rv = colors.gray,
				-- cv = colors.red,
				-- ce = colors.red,
				-- r = colors.aqua,
				-- rm = colors.aqua,
				-- ["r?"] = colors.aqua,
				-- ["!"] = colors.red,
				-- t = colors.red,
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
				theme = "dracula",
				-- theme = {
				-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
				-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
				-- 	active = { c = { fg = colors.fg, bg = colors.bg } },
				-- },
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
	-- TODO: Bufferline fix
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
}
