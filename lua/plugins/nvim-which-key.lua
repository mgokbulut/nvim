local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

local wk = require('which-key')

local mappings = {
  ['/'] = { ':CommentToggle<cr>'                                     , 'comment' },
  [';'] = { ':Commands'                                              , 'commands' },
  ['='] = { '<C-W>='                                                 , 'balance windows' },
  [' '] = { '<cmd>lua require("telescope.builtin").find_files()<cr>' , 'files' },
  f     = { '<cmd>lua require("telescope.builtin").live_grep()<cr>'  , 'ripgrep' },
  b     = { '<cmd>lua require("telescope.builtin").buffers()<cr>'    , 'buffers' },
  h     = { '<cmd>lua require("telescope.builtin").help_tags()<cr>'  , 'help' },
  z     = { ':MaximizerToggle<cr>'                                   , 'maximizer' },
  e     = { ':NvimTreeToggle<cr>'                                    , 'file tree' },
  t     = { ':Term<cr>'                                              , 'terminal'},
  n     = { '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'            , 'next diagnostic'},
  -- q     = { '<Plug>(coc-fix-current)'                                , 'quickfix' },
  --n     = { '<Plug>(coc-diagnostic-next)'                            , 'next diagnostic' },
  -- j     = { ':join'                                                  , 'join' },
  ['1'] = {':BufferLineGoToBuffer 1<cr>', 'which_key_ignore'},
  ['2'] = {':BufferLineGoToBuffer 2<cr>', 'which_key_ignore'},
  ['3'] = {':BufferLineGoToBuffer 3<cr>', 'which_key_ignore'},
  ['4'] = {':BufferLineGoToBuffer 4<cr>', 'which_key_ignore'},
  ['5'] = {':BufferLineGoToBuffer 5<cr>', 'which_key_ignore'},
  ['6'] = {':BufferLineGoToBuffer 6<cr>', 'which_key_ignore'},
  ['7'] = {':BufferLineGoToBuffer 7<cr>', 'which_key_ignore'},
  ['8'] = {':BufferLineGoToBuffer 8<cr>', 'which_key_ignore'},
  ['9'] = {':BufferLineGoToBuffer 9<cr>', 'which_key_ignore'},
}

-- a is for actions
mappings.a = {
  name = '+actions',
  f = {':!open .<cr>'                                                       , 'open in finder'},
  n = {':set nonumber!<cr>'                                                 , 'line-numbers'},
  y = {':%y+<cr>'                                                           , 'yank file'},
  S = {':set spell!<cr>'                                                    , 'spelling'},
  r = {':set norelativenumber!<cr>'                                         , 'relative line nums'},
  C = {':ColorizerToggle<cr>'                                               , 'colorizer'},
  t = {':TransparentToggle<cr>'                                             , 'transparent background'},
  -- c = {':CompileAndRun<cr>'                          , 'compile&run'},
  -- g = {':SignifyToggle<cr>'                          , 'signify'},
  -- T = {':call Toggle_transparent_background()<cr>'   , 'transparent background'},
  -- t = {':call TrimWhitespace()<cr>'                  , 'trim whitespaces'},
}

mappings.g = {
  name = '+git',
  a = {':Git add .<cr>'                        , 'add all'},
  b = {':Git blame<cr>'                        , 'blame'},
  B = {':GBrowse<cr>'                          , 'browse'},
  c = {':Git commit<cr>'                       , 'commit'},
  D = {':Git diff<cr>'                         , 'diff'},
  d = {':Gdiffsplit<cr>'                       , 'diff split'},
  g = {':Git<cr>'                              , 'status'},
  l = {':diffget //3<cr>'                      , 'get right'},
  h = {':diffget //2<cr>'                      , 'get left'},
  L = {':Git log<cr>'                          , 'log'},
  p = {':Git push<cr>'                         , 'push'},
  P = {':Git pull<cr>'                         , 'pull'},
  -- r = {':GRemove<cr>'                          , 'remove'},
}

mappings.l = {
  name = '+lsp',
  a = {'<cmd>lua require("functions").code_actions()<cr>'                , 'code actions'},
  I = {'<cmd>Telescope lsp_workspace_diagnostics<cr>'                    , 'diagnostics'},
  f = {'<cmd>lua vim.lsp.buf.formatting()<CR>'                           , 'formatting'},
}

mappings.t = {
  name = '+test',
  n = {':TestNearest<cr>'                , 'nearest Ultest'},
  N = {':TestNearest<cr>'                , 'nearest'},
  t = {':Ultest<cr>'                     , 'file ULtest'},
  f = {':TestFile<cr>'                   , 'file'},
  s = {':TestSuite<cr>'                  , 'Suite'},
  l = {':TestLast<cr>'                   , 'last'},
  v = {':TestVisit<cr>'                  , 'visit'},
}

local settings = {
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 1
  },
  layout = {
    height = { min = 4, max = 8 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  show_help = false, -- show help message on the command line when the popup is visible
}

local opts = {
  prefix = "<leader>"
}

wk.setup(settings)
wk.register(mappings, opts)
