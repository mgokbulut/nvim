local M = {}

function M.popupNui(command)
	local Popup = require("nui.popup")
	Popup({
		position = "50%",
		size = {
			width = 80,
			height = 40,
		},
		enter = true,
		focusable = true,
		zindex = 50,
		relative = "editor",
		border = {
			padding = {
				top = 2,
				bottom = 2,
				left = 3,
				right = 3,
			},
			style = "rounded",
			text = {
				top = " Dirbuf ",
				top_align = "center",
			},
		},
		buf_options = {
			modifiable = true,
			readonly = false,
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		keymap = {
			close = { "<Esc>", "<C-c>" },
		},
	}):mount()
	vim.cmd(":" .. command .. "<cr>")
end

function M.popup(command)
	local stats = vim.api.nvim_list_uis()[1]
	local width = stats.width
	local height = stats.height
	local winWidth = math.ceil(width * 0.8)
	local winHeight = math.ceil(height * 0.8)

	local buf = vim.api.nvim_create_buf(false, true)
	local winConfig = {
		relative = "editor",
		border = "single",
		width = winWidth,
		height = winHeight,
		col = math.ceil((width - winWidth) / 2),
		row = math.ceil((height - winHeight) / 2) - 1,
		style = "minimal",
	}
	local winId = vim.api.nvim_open_win(buf, true, winConfig)
	vim.api.nvim_command(command)
end

function M.exportColorsKitty()
	local fn = vim.fn
	local filename = os.getenv("HOME") .. "/.config/kitty/nvim_export.conf"
	local file = io.open(filename, "w")
	io.output(file)
	io.write("# vim:ft=kitty" .. "\n\n")
	io.write("# exported from " .. vim.g.colors_name .. "\n\n")
	local fg = fn.synIDattr(fn.hlID("Normal"), "fg")
	local bg = fn.synIDattr(fn.hlID("Normal"), "bg")
	io.write("foreground " .. fg .. "\n")
	io.write("background " .. bg .. "\n")
	io.write("selection_foreground " .. bg .. "\n")
	io.write("selection_background " .. fg .. "\n")
	for i = 0, 15 do
		local var = "g:terminal_color_" .. tostring(i)
		if fn.exists(var) == 1 then
			local tc = fn.eval(var)
			io.write("color" .. tostring(i) .. " " .. tc .. "\n")
			if i == 2 then
				io.write("cursor " .. tc .. "\n")
			end
		end
	end
	io.close(file)
	print("Colors exported to " .. filename)
end

function M.getGreeting(name)
	local tableTime = os.date("*t")
	local hour = tableTime.hour
	local greetingsTable = {
		[1] = "  Sleep well",
		[2] = "  Good morning",
		[3] = "  Good afternoon",
		[4] = "  Good evening",
		[5] = "望 Good night",
	}
	local greetingIndex = 0
	if hour == 23 or hour < 7 then
		greetingIndex = 1
	elseif hour < 12 then
		greetingIndex = 2
	elseif hour >= 12 and hour < 18 then
		greetingIndex = 3
	elseif hour >= 18 and hour < 21 then
		greetingIndex = 4
	elseif hour >= 21 then
		greetingIndex = 5
	end
	return greetingsTable[greetingIndex] .. ", " .. name
end

return M
