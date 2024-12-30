return {{
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local highlight = {
      "RainbowYellow",
      "RainbowGreen",
      "RainbowBlue",
      "RainbowAqua",
      "RainbowOrange",
      "RainbowRed",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "RainbowAqua", { fg = "#8ec07c" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fe8019" })
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#fb4934" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require "ibl".setup {
      indent = { char = "▏", },
      exclude = {
        filetypes = {
          "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble"
        },
      },
      scope = {
        show_start = false,
        show_end = false,
        highlight = highlight
      }
    }
    vim.wo.colorcolumn = "99999"
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}}
