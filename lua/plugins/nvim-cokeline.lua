local get_hex = require("cokeline/utils").get_hex

-- change the default color of the tabline
-- vim.cmd('hi TabLinefill guibg=' .. get_hex('Pmenu', 'bg'))

local comments_fg = get_hex("Comment", "fg")
local errors_fg = get_hex("DiagnosticError", "fg")
local warnings_fg = get_hex("DiagnosticWarn", "fg")
local unsaved_fg = get_hex("BufTabLineModifiedCurrent", "fg")

local components = {
	space = {
		text = " ",
		truncation = { priority = 1 },
	},

	two_spaces = {
		text = "  ",
		truncation = { priority = 1 },
	},

	separator = {
		text = function(buffer)
			return buffer.index ~= 1 and "▏" or ""
		end,
	},

	devicon = {
		text = function(buffer)
			return buffer.devicon.icon
		end,
		hl = {
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
	},

	index = {
		text = function(buffer)
			return buffer.index .. ": "
		end,
		hl = {
			fg = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and errors_fg)
					or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
					or nil
			end,
		},
	},

	unique_prefix = {
		text = function(buffer)
			return buffer.unique_prefix
		end,
		hl = {
			fg = comments_fg,
			style = "italic",
		},
		truncation = {
			priority = 7,
			direction = "left",
		},
	},

	filename = {
		text = function(buffer)
			return buffer.filename
		end,
		hl = {
			fg = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and errors_fg)
					or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
					or nil
			end,
			style = function(buffer)
				return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
					or (buffer.is_focused and "bold")
					or (buffer.diagnostics.errors ~= 0 and "underline")
					or nil
			end,
		},
		truncation = {
			priority = 6,
			direction = "left",
		},
	},

	diagnostics = {
		text = function(buffer)
			return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
				or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
				or ""
		end,
		hl = {
			fg = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and errors_fg)
					or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
					or nil
			end,
		},
		truncation = { priority = 2 },
	},

	close_or_unsaved = {
		text = function(buffer)
			return buffer.is_modified and "●" or ""
		end,
		hl = {
			fg = function(buffer)
				return buffer.is_modified and unsaved_fg or nil
			end,
		},
		delete_buffer_on_left_click = true,
		truncation = { priority = 5 },
	},
}

require("cokeline").setup({
	-- default_hl = {
	--   focused = {
	--     fg = get_hex('ColorColumn', 'bg'),
	--     bg = get_hex('Normal', 'fg'),
	--   },
	--   unfocused = {
	--     fg = get_hex('Normal', 'fg'),
	--     bg = get_hex('ColorColumn', 'bg'),
	--   },
	-- },
	-- default_hl = {
	--   focused = {
	--     fg = get_hex('Normal', 'fg'),
	--     bg = 'NONE',
	--   },
	--   unfocused = {
	--     fg = get_hex('Comment', 'fg'),
	--     bg = 'NONE',
	--   },
	-- },
	default_hl = {
		focused = {
			fg = get_hex("Normal", "fg"),
			bg = get_hex("Pmenu", "bg"),
		},
		unfocused = {
			fg = get_hex("Comment", "fg"),
			bg = get_hex("Pmenu", "bg"),
		},
	},
	buffers = {
		new_buffers_position = "next",
	},
	-- rendering = {
	-- 	left_sidebar = {
	-- 		filetype = "NvimTree",
	-- 		components = {
	-- 			{
	-- 				text = "  NvimTree",
	-- 				hl = {
	-- 					fg = vim.g.terminal_color_3,
	-- 					bg = get_hex("default", "bg"),
	-- 					style = "bold",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
	components = {
		components.space,
		components.separator,
		components.space,
		components.devicon,
		components.space,
		components.index,
		components.unique_prefix,
		components.filename,
		components.diagnostics,
		components.two_spaces,
		components.close_or_unsaved,
		components.space,
	},
})

local map = vim.api.nvim_set_keymap

map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
map("n", "<A-H>", "<Plug>(cokeline-switch-prev)", { silent = true })
map("n", "<A-L>", "<Plug>(cokeline-switch-next)", { silent = true })
