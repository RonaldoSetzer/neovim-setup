return {{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require "telescope.actions"
    local builtin = require "telescope.builtin"
    local pickers = {
      find_files = { theme = "ivy" },
      live_grep = { theme = "ivy" },
      buffers = { theme = "ivy" },
      help_tags = { theme = "ivy" },
      keymaps = { theme = "ivy" },
      lsp_definitions = { theme = "ivy" },
      lsp_references = { theme = "ivy" },
    }
    require('telescope').setup {
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          }
        },
      },
      pickers = pickers,
      extensions = { fzf = { } },
    }

    local utils = require "utils"
    utils.keymap('n', '<Leader>ff', builtin.find_files, '• Navigation: Find files')
    utils.keymap('n', '<Leader>fg', builtin.live_grep, '• Navigation: Find text')
    utils.keymap('n', '<Leader>fb', builtin.buffers, '• Navigation: Find open buffers')
    utils.keymap('n', '<leader>fk', builtin.keymaps, '• Navigation: Find keymaps')
    utils.keymap('n', '<leader>ft', builtin.treesitter, '• Navigation: Find treesitter')
  end
}}
