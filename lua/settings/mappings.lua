local opt = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Map for LeaderKey key
keymap('n', '<Space>', '<NOP>', opt)
vim.g.mapleader = ' '

-- Clear highlight on pressing ESC
keymap('n', '<esc>', '<cmd>noh<CR><esc>', opt)

-- Map jk, jj, kj for exit to normal mode
keymap('i', 'jk', '<Esc>', opt)
keymap('i', 'jj', '<Esc>', opt)
keymap('i', 'kk', '<Esc>', opt)
keymap('i', 'kj', '<Esc>', opt)

-- Map save to Ctrl + S
keymap('n', '<C-s>', '<cmd>w<CR>', {silent = true})
keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', {silent = true})

-- Map close buffer
keymap('n', '<Leader>w', '<cmd>bd<CR>', opt)

-- Map close quickfix
keymap('n', '<Leader>c', '<cmd>cclose<CR>', opt)

-- Navigation
keymap('n', '<C-h>', '<C-w>h', {silent = true})
keymap('n', '<C-j>', '<C-w>j', {silent = true})
keymap('n', '<C-k>', '<C-w>k', {silent = true})
keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Remove newbie crutches in Normal and Visual Mode
keymap('n', '<Down>', '<NOP>', opt)
keymap('n', '<Left>', '<NOP>', opt)
keymap('n', '<Right>', '<NOP>', opt)
keymap('n', '<Up>', '<NOP>', opt)

keymap('v', '<Down>', '<NOP>', opt)
keymap('v', '<Left>', '<NOP>', opt)
keymap('v', '<Right>', '<NOP>', opt)
keymap('v', '<Up>', '<NOP>', opt)

-- Swtich buffers with Tab
keymap('n', '<TAB>', ':bnext<CR>', opt)
keymap('n', '<S-TAB>', ':bprevious<CR>', opt)

-- Improve indenting (visual)
keymap('v', '<', '<gv', opt)
keymap('v', '>', '>gv', opt)

-- Yank to the end of the line
keymap('n', 'Y', 'y$', opt)

-- Breakline to indent position
keymap('i', '<C-c>', '<CR><Esc>O', opt)

-- PLUGINS

-- Telescope
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', opt)
keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', opt)
keymap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', opt)
keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', opt)
keymap('n', '<Leader>fp', '<cmd>Telescope projects<CR>', opt)

-- Fugitive
keymap('n', '<Leader>g', '<cmd>tab G<CR>', opt)

-- Trouble
keymap('n', '<Leader>d', '<cmd>TroubleToggle<CR>', opt)

-- NvimTree
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opt)
