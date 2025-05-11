local M = {}

function M.keymap(mode, keys, func, desc)
  local opts = {
    noremap = true,
    silent = true,
    desc = desc,
  }
  vim.keymap.set(mode, keys, func, opts)
end

return M
