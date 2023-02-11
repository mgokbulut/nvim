require("indent_blankline").setup({
	char = "▏",
	show_first_indent_level = false,
	show_current_context = true,
	indent_blankline_char = "▏",
	indent_blankline_show_trailing_blankline_indent = false,
	indent_blankline_show_first_indent_level = true,
	indent_blankline_use_treesitter = true,
	indent_blankline_show_current_context = true,
	filetype_exclude = {
		"help",
		"git",
		"markdown",
		"text",
		"terminal",
		"lspinfo",
		"packer",
		"TelescopePrompt",
	},
	buftype_exclude = {
		"terminal",
		"nofile",
	},
})
