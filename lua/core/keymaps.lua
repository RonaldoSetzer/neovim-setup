-- ╭─────────────────────────────────────────────────────╮
-- │  Keymaps Configurations                             │
-- ╰─────────────────────────────────────────────────────╯

local utils = require 'core.utils'

-- -------------------------------------------------------
-- General Keymaps
-- -------------------------------------------------------

-- Set Leader Key
utils.keymap('n', '<Space>', '<Nop>', '• LeaderKey: Set LeaderKey')

-- Clear highlight on pressing ESC
utils.keymap('n', '<Esc>', '<Cmd>noh<CR><Esc>', '• Highlight: Clear highlight')

-- Save File
utils.keymap('n', '<C-s>', '<Cmd>w<CR>', '• Save: Save current file')
utils.keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', '• Save: Save current file')

-- Close Buffers
utils.keymap('n', '<Leader>w', '<Cmd>bd<CR>', '• Buffer: Close current buffer')
utils.keymap('n', '<Leader>W', '<Cmd>%bd<CR>', '• Buffer: Close all buffers')

-- Close Quickfix
utils.keymap('n', '<Leader>c', '<Cmd>cclose<CR>', '• Quickfix: Close quickfix')

-- -------------------------------------------------------
-- Navigation Keymaps
-- -------------------------------------------------------

-- Switch Buffers
utils.keymap('n', '<Tab>', '<Cmd>bnext<CR>', '• Navigation: Switch to next buffer')
utils.keymap('n', '<S-Tab>', '<Cmd>bprevious<CR>', '• Navigation: Switch to previous buffer')

-- TMUX Navigation
utils.keymap('n', '<C-h>', '<Cmd><C-U>TmuxNavigateLeft<cr>', '• Navigation: Move to left window')
utils.keymap('n', '<C-j>', '<Cmd><C-U>TmuxNavigateDown<cr>', '• Navigation: Move to bottom window')
utils.keymap('n', '<C-k>', '<Cmd><C-U>TmuxNavigateUp<cr>', '• Navigation: Move to top window')
utils.keymap('n', '<C-l>', '<Cmd><C-U>TmuxNavigateRight<cr>', '• Navigation: Move to right window')

-- -------------------------------------------------------
-- Window Management Keymaps
-- -------------------------------------------------------

-- Resize Windows
utils.keymap('n', '_', '<C-w>5<', '• Resize: Shrink window vertically')
utils.keymap('n', '+', '<C-w>5>', '• Resize: Expand window vertically')

-- -------------------------------------------------------
-- Disable Arrow Keys
-- -------------------------------------------------------

-- Remove newbie crutches in Normal and Visual Mode
utils.keymap('n', '<Down>', '<Nop>', '• Disable: Arrow Down on Normal Mode')
utils.keymap('n', '<Left>', '<Nop>', '• Disable: Arrow Left on Normal Mode')
utils.keymap('n', '<Right>', '<Nop>', '• Disable: Arrow Right on Normal Mode')
utils.keymap('n', '<Up>', '<Nop>', '• Disable: Arrow Up on Normal Mode')

utils.keymap('v', '<Down>', '<Nop>', '• Disable: Arrow Down on Visual Mode')
utils.keymap('v', '<Left>', '<Nop>', '• Disable: Arrow Left on Visual Mode')
utils.keymap('v', '<Right>', '<Nop>', '• Disable: Arrow Right on Visual Mode')
utils.keymap('v', '<Up>', '<Nop>', '• Disable: Arrow Up on Visual Mode')

-- -------------------------------------------------------
-- Indentation Keymaps
-- -------------------------------------------------------

-- Improve Indentation in Visual Mode
utils.keymap('v', '<', '<gv', '• Indenting: Shift left')
utils.keymap('v', '>', '>gv', '• Indenting: Shift right')

-- -------------------------------------------------------
-- Other Keymaps
-- -------------------------------------------------------

-- Yank to the end of the line
utils.keymap('n', 'Y', 'y$', '• Yank: Yank to the end of the line')

-- Map for Exit from Insert Mode
utils.keymap('i', 'jk', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'jj', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'kk', '<Esc>', '• Exit: Exit insert mode')
utils.keymap('i', 'kj', '<Esc>', '• Exit: Exit insert mode')
