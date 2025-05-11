-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = "",
--     staged = "S",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "U",
--     ignored = "◌"
--   },
--   folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
-- }
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open in Vertical Split'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close the tree'))
  vim.keymap.set('n', 'X', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'R', api.fs.rename, opts('Rename'))
end

nvim_tree.setup({
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = { hint = "", info = "", warning = "", error = "" }
  },
  update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
  git = { enable = true, ignore = true, timeout = 500 },
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false
  },
  renderer = {
    root_folder_label = false,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "",
          ignored = "◌"
        },
        folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
      }
    }
  }
})
