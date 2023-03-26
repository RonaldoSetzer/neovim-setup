local keymap = function(mode, keys, func, desc)
  local opts = {
    noremap = true,
    silent = true,
    desc = desc
  }
  vim.keymap.set(mode, keys, func, opts)
end

-- Map for LeaderKey key
keymap('n', '<Space>', '<NOP>', '• LeaderKey: Set LeaderKey')
vim.g.mapleader = ' '

-- Clear highlight on pressing ESC
keymap('n', '<esc>', '<cmd>noh<CR><esc>', '• Highlight: Clear highlight')

-- Map jk, jj, kj for exit to normal mode
keymap('i', 'jk', '<Esc>', '• Exit: Exit insert mode')
keymap('i', 'jj', '<Esc>', '• Exit: Exit insert mode')
keymap('i', 'kk', '<Esc>', '• Exit: Exit insert mode')
keymap('i', 'kj', '<Esc>', '• Exit: Exit insert mode')

-- Map save to Ctrl + S
keymap('n', '<C-s>', '<cmd>w<CR>', '• Save: Save current file')
keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', '• Save: Save current file')

-- Map close buffer
keymap('n', '<Leader>w', '<cmd>bd<CR>', '• Buffer: Close current buffer')

-- Map close quickfix
keymap('n', '<Leader>c', '<cmd>cclose<CR>', '• Quickfix: Close quickfix')

-- Navigation
keymap('n', '<C-h>', '<C-w>h', '• Navigation: Move to left window')
keymap('n', '<C-j>', '<C-w>j', '• Navigation: Move to bottom window')
keymap('n', '<C-k>', '<C-w>k', '• Navigation: Move to top window')
keymap('n', '<C-l>', '<C-w>l', '• Navigation: Move to right window')
keymap('n', '<TAB>', '<cmd>bnext<CR>', '• Navigation: Switch to next buffer')
keymap('n', '<S-TAB>', '<cmd>bprevious<CR>', '• Navigation: Switch to previous buffer')

-- Resize window with shift + and shift -
keymap('n', '_', '<c-w>5<', '• Resize: Shrink window vertically')
keymap('n', '+', '<c-w>5>', '• Resize: Expand window vertically')

-- Remove newbie crutches in Normal and Visual Mode
keymap('n', '<Down>', '<NOP>', '• Disable: Arrow Down on Normal Mode')
keymap('n', '<Left>', '<NOP>', '• Disable: Arrow Left on Normal Mode')
keymap('n', '<Right>', '<NOP>', '• Disable: Arrow Right on Normal Mode')
keymap('n', '<Up>', '<NOP>', '• Disable: Arrow Up on Normal Mode')

keymap('v', '<Down>', '<NOP>', '• Disable: Arrow Down on Visual Mode')
keymap('v', '<Left>', '<NOP>', '• Disable: Arrow Left on Visual Mode')
keymap('v', '<Right>', '<NOP>', '• Disable: Arrow Right on Visual Mode')
keymap('v', '<Up>', '<NOP>', '• Disable: Arrow Up on Visual Mode')

-- Improve indenting (visual)
keymap('v', '<', '<gv', '• Indenting: Shift left')
keymap('v', '>', '>gv', '• Indenting: Shift right')

-- Yank to the end of the line
keymap('n', 'Y', 'y$', '• Yank: Yank to the end of the line')

-- Abreviations
vim.cmd("cabbrev help vert help")
vim.cmd("cabbrev h vert h")
vim.cmd("cabbrev Copilot vert Copilot")
vim.cmd("cabbrev new vert new")
