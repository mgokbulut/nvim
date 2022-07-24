-----------------------------------------------------------
-- General
-----------------------------------------------------------
-- vim.opt.mouse = 'a'                    -- enable mouse support
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.swapfile = false -- don't use swapfile
vim.opt.undofile = true -- undofile
vim.opt.iskeyword:append("-") -- treat dash separated words as a word
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true -- show line number
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'              -- line lenght marker at 80 columns
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- orizontal split to the bottom
vim.opt.ignorecase = true -- ignore cases when searching
vim.opt.smartcase = true -- ignore lowercase for the whole pattern
vim.opt.linebreak = true -- wrap on word boundary
vim.opt.cursorline = true -- highlights cursor line
vim.opt.scrolloff = 10 -- Keep 10 lines below and above the cursor when scrolling
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
-- vim.opt.signcolumn='number'         -- Show signs on number column
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.shortmess:append("csI") -- disable nvim intro
vim.opt.fillchars:append({ eob = " " }) -- removes ~ symbols on blank lines

-- Remove -- Insert -- text at console
vim.cmd([[set noshowmode]])

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
	false
)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true -- enable background buffers
vim.opt.history = 100 -- remember n lines in history
vim.opt.lazyredraw = true -- faster scrolling
vim.opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- shift 2 spaces when tab
vim.opt.tabstop = 2 -- 1 tab == 2 spaces
vim.opt.smartindent = true -- autoindent new lines

-- don't auto commenting new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
-- vim.cmd [[
--   autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
-- ]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
vim.opt.completeopt = "menuone,noselect"

-----------------------------------------------------------
-- Font
-----------------------------------------------------------
vim.cmd("set guifont=Fira_Code:h20")
-- vim.cmd("highlight Normal guibg=#32302f")

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
vim.cmd([[command Term :botright vsplit term://$SHELL]])

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]])

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
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
