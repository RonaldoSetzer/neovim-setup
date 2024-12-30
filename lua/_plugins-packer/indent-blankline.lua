local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then return end
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

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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

-- Good Highlight Colors ["#E06C75", "#E5C07B", "#98C379", "#56B6C2", "#61AFEF", "#C678DD"]
