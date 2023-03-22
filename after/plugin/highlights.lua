local cmpGroups = {
	-- "PmenuSel",
	-- "Pmenu",
	"CmpItemAbbrDeprecated",
	"CmpItemAbbrMatch",
	"CmpItemAbbrMatchFuzzy",
	-- "CmpItemMenu",
	"CmpItemKindField",
	"CmpItemKindProperty",
	"CmpItemKindEvent",
	"CmpItemKindText",
	"CmpItemKindEnum",
	"CmpItemKindKeyword",
	"CmpItemKindConstant",
	"CmpItemKindConstructor",
	"CmpItemKindReference",
	"CmpItemKindFunction",
	"CmpItemKindStruct",
	"CmpItemKindClass",
	"CmpItemKindModule",
	"CmpItemKindOperator",
	"CmpItemKindVariable",
	"CmpItemKindFile",
	"CmpItemKindUnit",
	"CmpItemKindSnippet",
	-- "CmpItemKindFolder",
	"CmpItemKindMethod",
	"CmpItemKindValue",
	"CmpItemKindEnumMember",
	"CmpItemKindInterface",
	"CmpItemKindColor",
	"CmpItemKindTypeParameter",
}

-- local hs =
-- {
--   PmenuSel = { bg = "#282C34", fg = "NONE" },
--   Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
--   CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE"},
--   CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE" },
--   CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE" },
--   CmpItemMenu = { fg = "#C792EA", bg = "NONE" },
--   CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
--   CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
--   CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
--   CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
--   CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
--   CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
--   CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
--   CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
--   CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
--   CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
--   CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
--   CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
--   CmpItemKindSnippet = { fg = "#000000", bg = "#ffffff" },
--   CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
--   CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
--   CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
--   CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
--   CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
--   CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
--   CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
-- }

-- for key, value in pairs(hs) do
--     if type(value) == "table" then
--         -- print(key .. ": table")
--         -- print(value["fg"])
--         -- print(value["bg"])
--          -- print('highlight Pmenu bg=' .. value['bg'] .. ' fg=' .. value['fg'])
--          vim.cmd('highlight ' .. key .. ' guibg=' .. value['bg'] .. ' guifg=' .. value['fg'])
--     print('highlight ' .. key .. ' guibg=' .. value['bg'] .. ' guifg=' .. value['fg'])
--
--   --       for key2, value2 in pairs(value) do
--   --         print("  " .. key2 .. ": " .. value2)
--   --       end
--     else
--         print("yarrak")
--         print(key .. ": " .. value)
--     end
-- end

local function GetHiVal(name, layer)
	local fn = vim.fn
	local res = fn["synIDattr"](fn["synIDtrans"](fn["hlID"](name)), layer .. "#")
	-- if the highlight group with layer doesn't exists
	if res == "" then
		-- res = "#ffffff"
		res = "None"
	end
	return res
end

for k, v in pairs(cmpGroups) do
	local fg = GetHiVal(v, "fg")
	local bg = GetHiVal(v, "bg")
	-- print(v .. " " .. fg .. " " .. bg)
	vim.cmd(":hi " .. v .. " guifg=" .. bg .. " guibg=" .. fg)
end

-- Exceptions
vim.cmd(":hi CmpItemKindFolder guibg=#F7A413 guifg=None")

-- Others
vim.cmd(":hi SignColumn guibg=None")

-- Diagnostics
local diagnosticGroups = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" }
for k, v in pairs(diagnosticGroups) do
	local fn = vim.fn
	local fg = fn["synIDattr"](fn["synIDtrans"](fn["hlID"](v)), "fg" .. "#")
	vim.cmd(":hi " .. v .. " guifg=" .. fg .. " guibg=None")
end

local gitSignsGroups = {
	"GitSignsChangedelete",
	"GitSignsTopdelete",
	"GitSignsAdd",
	"GitSignsChange",
	"GitSignsUntracked",
	"GitSignsDelete",
	"GitSignsAddNr",
	"GitSignsAddLn",
	"GitSignsChangeNr",
	"GitSignsChangeLn",
	"GitSignsDeleteNr",
	"GitSignsDeleteLn",
}

for k, v in pairs(gitSignsGroups) do
	local fn = vim.fn
	local fg = fn["synIDattr"](fn["synIDtrans"](fn["hlID"](v)), "fg" .. "#")
	vim.cmd(":hi " .. v .. " guifg=" .. fg .. " guibg=None")
end

-- Indentation Highlights
vim.cmd(":hi IndentBlanklineChar guifg=#928374")
vim.cmd(":hi IndentBlanklineContextChar guifg=#ffffff")
vim.cmd(":hi MiniIndentscopeSymbol guifg=#ffffff")

-- Pmenu
vim.cmd(":hi IndentBlanklineContextChar guifg=#ffffff")
vim.cmd(":hi MiniIndentscopeSymbol guifg=#ffffff")

local menuGroups = {
	-- "NormalFloat",
	-- CocMenuSelxxx links to PmenuSel
	-- "NoicePopupmenu",
	-- "NormalFloatNoice"
	-- NoicePopupmenuSelected
	-- NoiceScrollbar
	-- NoiceScrollbarThumbxxx links to PmenuThumb
	-- "PmenuSel",
	"Pmenu",
	-- "WhichKeyFloat",
	-- "PmenuThumb",
	-- "TabLineFill",
	-- "CursorLineNr",
	-- "CursorLineSign",
	-- "CursorLineFold",
	-- "CursorColumn",
	-- "CursorLine",
	-- "NeoTreeCursorLine",

	-- "CursorLineSign",
	-- "CursorLineFold",
	-- "CursorLine",
}

for k, v in pairs(menuGroups) do
	local fn = vim.fn
	local fg = fn["synIDattr"](fn["synIDtrans"](fn["hlID"](v)), "fg" .. "#")
	vim.cmd(":hi " .. v .. " guifg=" .. fg .. " guibg=none")
end

vim.cmd(":hi CursorLineNr guifg=#e76868")
-- vim.cmd(":hi CursorLine guifg=None guibg=None")
vim.cmd(":hi NeoTreeCursorLine guifg=#e76868 guibg=None")
-- vim.cmd(":hi Pmenu guifg=#e76868")

vim.cmd(":hi AlphaShortcut guifg=#fb4934")
vim.cmd(":hi AlphaHeader guifg=#fabd2f")
vim.cmd(":hi AlphaButtons guifg=#fbf1c7")

vim.cmd("hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK")

vim.cmd(":hi gitconflictcurrent guibg=#04333c")
vim.cmd(":hi GitConflictIncoming  guibg=#3c3a07")
vim.cmd(":hi GitConflictCurrentLabel guibg=#fb4934")
vim.cmd(":hi GitConflictIncomingLabel guibg=#fb4934")

vim.cmd(":hi NeoTreeNormal guibg=#3c3836")
vim.cmd(":hi NeoTreeNormalNC guibg=#3c3836")
vim.cmd(":hi NeoTreeStatusLine guibg=#3c3836")
vim.cmd(":hi NeoTreeStatusLineNC guibg=#3c3836")
-- vim.cmd(":hi HighlighterColor guibg=#988474") -- My creation for virtual space
vim.cmd(":hi HighlighterColor guibg=#948474") -- My creation for virtual space
-- vim.cmd(":hi HighlighterColor guibg=#9c8474") -- My creation for virtual space

-- NeoTreeStatusLinexxx links to StatusLine
-- NeoTreeStatusLineNCxxx links to StatusLineNC

-- NeoTreeNormalNCxxx links to NormalNC
-- NeoTreeNormalxxx links to Normal
-- NeoTreeNormalNCxxx links to NormalNC
-- NeoTreeSignColumnxxx links to SignColumn
-- NeoTreeStatusLinexxx links to StatusLine
-- NeoTreeStatusLineNCxxx links to StatusLineNC
-- NeoTreeVertSplitxxx links to VertSplit
-- NeoTreeWinSeparatorxxx links to WinSeparator
-- NeoTreeEndOfBufferxxx links to EndOfBuffer
-- NeoTreeFloatBorderxxx links to FloatBorder
-- NeoTreeFloatNormalxxx links to NormalFloat
-- NeoTreeFloatTitlexxx guifg=#ebdbb2 guibg=#282828
-- NeoTreeTitleBarxxx guifg=#282828 guibg=#665c54
-- NeoTreeBufferNumberxxx links to SpecialChar
-- NeoTreeDimTextxxx guifg=#505050
-- NeoTreeMessagexxx gui=italic guifg=#505050
-- NeoTreeFadeText1xxx guifg=#626262
-- NeoTreeFadeText2xxx guifg=#444444
-- NeoTreeDotfilexxx guifg=#626262
-- NeoTreeHiddenByNamexxx links to NeoTreeDotfile
-- NeoTreeCursorLinexxx guifg=#e76868
-- NeoTreeDirectoryNamexxx links to Directory
-- NeoTreeDirectoryIconxxx links to Directory
-- NeoTreeFileIconxxx links to NeoTreeDirectoryIcon
-- NeoTreeFileNamexxx cleared
-- NeoTreeFileNameOpenedxxx gui=bold
-- NeoTreeSymbolicLinkTargetxxx links to NeoTreeFileName
-- NeoTreeFilterTermxxx links to SpecialChar
-- NeoTreeRootNamexxx gui=bold,italic
-- NeoTreeIndentMarkerxxx links to NeoTreeDimText
-- NeoTreeExpanderxxx links to NeoTreeDimText
-- NeoTreeModifiedxxx guifg=#d7d787
-- NeoTreeWindowsHiddenxxx links to NeoTreeDotfile
-- NeoTreePreviewxxx links to Search
-- NeoTreeGitAddedxxx links to GitSignsAdd
-- NeoTreeGitDeletedxxx links to GitSignsDelete
-- NeoTreeGitModifiedxxx links to GitSignsChange
-- NeoTreeGitConflictxxx gui=bold,italic guifg=#ff8700
-- NeoTreeGitIgnoredxxx links to NeoTreeDotfile
-- NeoTreeGitRenamedxxx links to NeoTreeGitModified
-- NeoTreeGitStagedxxx links to NeoTreeGitAdded
-- NeoTreeGitUnstagedxxx links to NeoTreeGitConflict
-- NeoTreeGitUntrackedxxx gui=italic guifg=#ff8700
-- NeoTreeTabActivexxx gui=bold
-- NeoTreeTabInactivexxx guifg=#777777 guibg=#141414
-- NeoTreeTabSeparatorActivexxx guifg=#0a0a0a
-- NeoTreeTabSeparatorInactivexxx guifg=#101010 guibg=#141414

-- GitConflictAncestorxxx cterm=bold gui=bold guibg=#68217a
-- GitConflictCurrentLabelxxx guibg=#404040
-- GitConflictIncomingLabelxxx guibg=#404040
-- GitConflictAncestorLabelxxx guibg=#a634c3

-- local colors = {
-- 	dark0_hard = "#1d2021",
-- 	dark0 = "#282828",
-- 	dark0_soft = "#32302f",
-- 	dark1 = "#3c3836",
-- 	dark2 = "#504945",
-- 	dark3 = "#665c54",
-- 	dark4 = "#7c6f64",
-- 	light0_hard = "#f9f5d7",
-- 	light0 = "#fbf1c7",
-- 	light0_soft = "#f2e5bc",
-- 	light1 = "#ebdbb2",
-- 	light2 = "#d5c4a1",
-- 	light3 = "#bdae93",
-- 	light4 = "#a89984",
-- 	bright_red = "#fb4934",
-- 	bright_green = "#b8bb26",
-- 	bright_yellow = "#fabd2f",
-- 	bright_blue = "#83a598",
-- 	bright_purple = "#d3869b",
-- 	bright_aqua = "#8ec07c",
-- 	bright_orange = "#fe8019",
-- 	neutral_red = "#cc241d",
-- 	neutral_green = "#98971a",
-- 	neutral_yellow = "#d79921",
-- 	neutral_blue = "#458588",
-- 	neutral_purple = "#b16286",
-- 	neutral_aqua = "#689d6a",
-- 	neutral_orange = "#d65d0e",
-- 	faded_red = "#9d0006",
-- 	faded_green = "#79740e",
-- 	faded_yellow = "#b57614",
-- 	faded_blue = "#076678",
-- 	faded_purple = "#8f3f71",
-- 	faded_aqua = "#427b58",
-- 	faded_orange = "#af3a03",
-- 	gray = "#928374",
-- }

--print(GetHiVal("CmpItemKindColor", "fg"))
-- for k, v in pairs(hs) do
--   vim.cmd(':hi ' .. k .. ' guifg=' .. v['fg'] .. ' guibg=' .. v['bg'])
-- end
-- CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
