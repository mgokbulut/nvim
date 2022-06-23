local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = 'top'
    },
    sorting_strategy = 'ascending',
    prompt_prefix = '🔍 ',
    mappings = {
        i = {
            ['<esc>'] = actions.close,
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
        },
    },
    file_ignore_patterns = {
      'vendor',
      'out',
      'android',
      'ios',
      'docs',
      'web',
      ".git/",
      "node_modules",
      "__snapshots_-" ,
    },
    -- file_sorter = require("telescope.sorters").get_generic_sorter,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    },
    pickers = {
      live_grep = {
        only_sort_text = true
      }
    }
  },
})

require('telescope').load_extension('fzy_native')


