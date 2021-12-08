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
        },
    },
})

