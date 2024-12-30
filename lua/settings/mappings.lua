local utils = require 'utils'
-- Map for LeaderKey key
utils.keymap('n', '<Space>', '<NOP>', '• LeaderKey: Set LeaderKey')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlight on pressing ESC
utils.keymap('n', '<esc>', '<cmd>noh<CR><esc>', '• Highlight: Clear highlight')

-- Map jk, jj, kj for exit to normal mode
utils.keymap('i', 'jk', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'jj', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'kk', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'kj', '<Esc>', '• Exit: Exit insert mode')

-- Map save to Ctrl + S
utils.keymap('n', '<C-s>', '<cmd>w<CR>', '• Save: Save current file')
utils.keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', '• Save: Save current file')
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Map close buffer
utils.keymap('n', '<Leader>w', '<cmd>bd<CR>', '• Buffer: Close current buffer')
utils.keymap('n', '<Leader>W', '<cmd>%bd<CR>', '• Buffer: Close all buffers')

-- Map close quickfix
utils.keymap('n', '<Leader>c', '<cmd>cclose<CR>', '• Quickfix: Close quickfix')

-- Navigation
utils.keymap('n', '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', '• Navigation: Move to left window')
utils.keymap('n', '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>', '• Navigation: Move to bottom window')
utils.keymap('n', '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>', '• Navigation: Move to top window')
utils.keymap('n', '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>', '• Navigation: Move to right window')
utils.keymap('n', '<TAB>', '<cmd>bnext<CR>', '• Navigation: Switch to next buffer')
utils.keymap('n', '<S-TAB>', '<cmd>bprevious<CR>', '• Navigation: Switch to previous buffer')

-- Resize window with shift + and shift -
utils.keymap('n', '_', '<c-w>5<', '• Resize: Shrink window vertically')
utils.keymap('n', '+', '<c-w>5>', '• Resize: Expand window vertically')

-- Remove newbie crutches in Normal and Visual Mode
utils.keymap('n', '<Down>', '<NOP>', '• Disable: Arrow Down on Normal Mode')
utils.keymap('n', '<Left>', '<NOP>', '• Disable: Arrow Left on Normal Mode')
utils.keymap('n', '<Right>', '<NOP>', '• Disable: Arrow Right on Normal Mode')
utils.keymap('n', '<Up>', '<NOP>', '• Disable: Arrow Up on Normal Mode')

utils.keymap('v', '<Down>', '<NOP>', '• Disable: Arrow Down on Visual Mode')
utils.keymap('v', '<Left>', '<NOP>', '• Disable: Arrow Left on Visual Mode')
utils.keymap('v', '<Right>', '<NOP>', '• Disable: Arrow Right on Visual Mode')
utils.keymap('v', '<Up>', '<NOP>', '• Disable: Arrow Up on Visual Mode')

-- Improve indenting (visual)
utils.keymap('v', '<', '<gv', '• Indenting: Shift left')
utils.keymap('v', '>', '>gv', '• Indenting: Shift right')

-- Yank to the end of the line
utils.keymap('n', 'Y', 'y$', '• Yank: Yank to the end of the line')

-- Abreviations
vim.cmd("cabbrev help vert help")
vim.cmd("cabbrev h vert h")
vim.cmd("cabbrev Copilot vert Copilot")
vim.cmd("cabbrev new vert new")
