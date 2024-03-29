local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ██████╗  █████╗  ██████╗██╗  ██╗ ]],
  [[██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝ ]],
  [[██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗      ██████╔╝███████║██║     █████╔╝  ]],
  [[██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝      ██╔══██╗██╔══██║██║     ██╔═██╗  ]],
  [[╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗    ██████╔╝██║  ██║╚██████╗██║  ██╗ ]],
  [[ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ]],
  [[                                                                                                   ]],
  [[███╗   ███╗██████╗         ██████╗  ██████╗ ██╗  ██╗██████╗ ██╗   ██╗██╗     ██╗   ██╗████████╗    ]],
  [[████╗ ████║██╔══██╗       ██╔════╝ ██╔═══██╗██║ ██╔╝██╔══██╗██║   ██║██║     ██║   ██║╚══██╔══╝    ]],
  [[██╔████╔██║██████╔╝       ██║  ███╗██║   ██║█████╔╝ ██████╔╝██║   ██║██║     ██║   ██║   ██║       ]],
  [[██║╚██╔╝██║██╔══██╗       ██║   ██║██║   ██║██╔═██╗ ██╔══██╗██║   ██║██║     ██║   ██║   ██║       ]],
  [[██║ ╚═╝ ██║██║  ██║██╗    ╚██████╔╝╚██████╔╝██║  ██╗██████╔╝╚██████╔╝███████╗╚██████╔╝   ██║       ]],
  [[╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝ ╚═════╝    ╚═╝       ]],
}
dashboard.section.buttons.val = {
	dashboard.button("<space>", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("e", "  Explorer", ":e .<CR>"),
	dashboard.button("t", "  Tasks Todo", "<cmd>lua _TASKELL_TOGGLE()<cr>"),
	dashboard.button("s", "  Spotify", "<cmd>lua _SPOTIFY_TOGGLE()<cr>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

-- [[                               __                ]],
-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
