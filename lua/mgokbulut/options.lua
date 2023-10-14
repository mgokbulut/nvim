vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.mouse = "" -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard

-- vim.opt.clipboard = {
-- 	name = "WslClipboard",
-- 	copy = {
-- 		["+"] = "clip.exe",
-- 		["*"] = "clip.exe",
-- 	},
-- 	paste = {
-- 		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring():gsub("\\r", ""))',
-- 		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring():gsub("\\r", ""))',
-- 	},
-- 	cache_enabled = 0,
-- }

vim.opt.swapfile = false -- don't use swapfile
vim.opt.undofile = true -- undofile
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.number = true -- show line number
vim.opt.showmatch = true -- highlight matching parenthesis
-- vim.opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- orizontal split to the bottom
vim.opt.ignorecase = true -- ignore cases when searching
vim.opt.smartcase = true -- ignore lowercase for the whole pattern
vim.opt.linebreak = true -- wrap on word boundary
-- vim.opt.cursorline = true -- highlights cursor line
vim.opt.scrolloff = 10 -- Keep 10 lines below and above the cursor when scrolling
vim.opt.updatetime = 50 -- Faster completion
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.shortmess:append("csI") -- disable nvim intro
vim.opt.fillchars:append({ eob = " " }) -- removes ~ symbols on blank lines

vim.opt.hidden = true -- enable background buffers
vim.opt.history = 100 -- remember n lines in history
-- vim.opt.lazyredraw = true -- faster scrolling
vim.opt.synmaxcol = 240 -- max column for syntax highlight

-- vim.opt.iskeyword:append("-") -- treat dash separated words as a word
-- vim.opt.expandtab = false -- use spaces instead of tabs
-- vim.opt.shiftwidth = 2 -- shift 2 spaces when tab
-- vim.opt.tabstop = 2 -- 1 tab == 2 spaces
-- vim.opt.smartindent = true -- autoindent new lines

-- Editing -------------------------------------------------------------------
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.smarttab = true -- Make tabbing smarter (will realize you have 2 vs 4)
vim.opt.shiftwidth = 2 -- Use this number of spaces for indentation
vim.opt.smartindent = true -- Make indenting smart
vim.opt.autoindent = true -- Use auto indent
vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object
vim.opt.virtualedit = "block" -- Allow going past the end of line in visual block mode
vim.opt.startofline = false -- Don't position cursor on line start after certain operations
vim.opt.breakindent = true -- Indent wrapped lines to match line start

vim.opt.completeopt = { "menu", "noinsert", "noselect" } -- Customize completions

-- Spelling -------------------------------------------------------------------
vim.opt.spelllang = "en_us" -- Define spelling dictionaries
vim.opt.complete:append("kspell") -- Add spellcheck options for autocomplete
vim.opt.complete:remove("t") -- Don't use tags for completion
-- vim.opt.spelloptions = 'camel'    -- Treat parts of camelCase words as seprate words

vim.opt.completeopt = "menuone,noselect"

vim.cmd("set noshowmode") -- removes the insert, visual text at the console

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

-- Disables auto commenting when entering to a new line
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.cmd("set fo-=c fo-=r fo-=o")
	end,
})

-- resize splits if window got resized
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd("tabdo wincmd =")
--   end,
-- })

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.cmd([[
  let g:clipboard = {
              \   'name': 'WslClipboard',
              \   'copy': {
              \      '+': '/mnt/c/Windows/System32/clip.exe',
              \      '*': '/mnt/c/Windows/System32/clip.exe',
              \    },
              \   'paste': {
              \      '+': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
              \      '*': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
              \   },
              \   'cache_enabled': 0,
              \ }
]])
