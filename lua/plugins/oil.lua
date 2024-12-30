return {{
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" }, 
  config = function()
    local oil = require 'oil'
    oil.setup {
      columns = {"icon"},
      view_options = { show_hidden = true },
      float = {
        winblend = 10,
        border = "single",
        width = 0.6,
        height = 0.6,
        highlights = {
          border = "rounded",
          background = "Normal",
        },
        preview_splits = "right",
      },
    }
    local utils = require "utils"
    utils.keymap('n', '<Leader>+', oil.toggle_float, '• File Explorer: Open Oil')
  end
}}
