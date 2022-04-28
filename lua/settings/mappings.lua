-- Map for LeaderKey key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Clear highlight on pressing ESC
vim.api.nvim_set_keymap('n', '<esc>', '<cmd>noh<CR><esc>', {noremap = true, silent = true})

-- Map jk, jj, kj for exit to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kk', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true, silent = true})

-- Map save to Ctrl + S
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', {silent = true})

-- Map close buffer
vim.api.nvim_set_keymap('n', '<Leader>w', ':bd<CR>', {noremap = true, silent = true})

-- Navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Remove newbie crutches in Normal and Visual Mode
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<Down>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Left>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Right>', '<NOP>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Up>', '<NOP>', {noremap = true, silent = true})

-- Swtich buffers with Tab
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Improve indenting (visual)
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Yank to the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true, silent = true})

-- Breakline to indent position
vim.api.nvim_set_keymap('i', '<C-c>', '<CR><Esc>O', {noremap = true, silent = true})
