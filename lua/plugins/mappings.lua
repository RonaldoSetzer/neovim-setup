local keymap = function(mode, keys, func, desc)
  local opts = {
    noremap = true,
    silent = true,
    desc = desc
  }
  vim.keymap.set(mode, keys, func, opts)
end

-- Treesitter
keymap('n', 'Kts', '<cmd>TSHighlightCapturesUnderCursor<CR>', '• Treesitter: Show captures under cursor')

-- Telescope
local telescope = require 'telescope.builtin'
keymap('n', '<Leader>ff', telescope.find_files, '• Navigation: Find files')
keymap('n', '<Leader>fg', telescope.live_grep, '• Navigation: Find text')
keymap('n', '<Leader>fb', telescope.buffers, '• Navigation: Find open buffers')
keymap('n', '<leader>fk', telescope.keymaps, '• Navigation: Find keymaps')
keymap('n', '<Leader>fp', '<cmd>Telescope projects<CR>', '• Navigation: Find projects')
keymap('n', '<Leader>fk', '<cmd>Telescope keymaps<CR>', '• Navigation: Find keymaps')

-- Fugitive
keymap('n', '<Leader>g', '<cmd>tab G<CR>', '• Git: Open fugitive')

-- Trouble
keymap('n', '<Leader>d', '<cmd>TroubleToggle<CR>', '• Diagnostic: Open trouble')

-- NvimTree
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', '• File Explorer: Open NvimTree')
