-- ╭─────────────────────────────────────────────────────╮
-- │  Keymaps Configurations                             │
-- ╰─────────────────────────────────────────────────────╯

function keymap(mode, keys, func, desc)
	local opts = {
		noremap = true,
		silent = true,
		desc = desc,
	}
	vim.keymap.set(mode, keys, func, opts)
end

-- -------------------------------------------------------
-- General Keymaps
-- -------------------------------------------------------

-- Set Leader Key
keymap("n", "<Space>", "<Nop>", "• LeaderKey: Set LeaderKey")

-- Clear highlight on pressing ESC
keymap("n", "<Esc>", "<Cmd>noh<CR><Esc>", "• Highlight: Clear highlight")

-- Save File
keymap("n", "<C-s>", "<Cmd>w<CR>", "• Save: Save current file")
keymap("i", "<C-s>", "<C-o>:w<CR><Esc>", "• Save: Save current file")

-- Close Buffers
keymap("n", "<Leader>w", "<Cmd>bd<CR>", "• Buffer: Close current buffer")
keymap("n", "<Leader>W", "<Cmd>%bd<CR>", "• Buffer: Close all buffers")

-- -------------------------------------------------------
-- Navigation Keymaps
-- -------------------------------------------------------

-- Switch Buffers
keymap("n", "<Tab>", "<Cmd>bnext<CR>", "• Navigation: Switch to next buffer")
keymap("n", "<S-Tab>", "<Cmd>bprevious<CR>", "• Navigation: Switch to previous buffer")

-- Quickfix List Navigation
keymap("n", "<Leader>cc", "<Cmd>cclose<CR>", "• Quickfix: Close quickfix")
keymap("n", "<Leader>co", "<Cmd>copen<CR>", "• Quickfix: Open quickfix")
keymap("n", "<leader>cn", "<Cmd>cnext<CR>", "• Quickfix: Go to next item")
keymap("n", "<leader>cp", "<Cmd>cprev<CR>", "• Quickfix: Go to previous item")

-- -------------------------------------------------------
-- Window Management Keymaps
-- -------------------------------------------------------

-- Resize Windows
keymap("n", "_", "<C-w>5<", "• Resize: Shrink window vertically")
keymap("n", "+", "<C-w>5>", "• Resize: Expand window vertically")

-- -------------------------------------------------------
-- Disable Arrow Keys
-- -------------------------------------------------------

-- Remove newbie crutches in Normal and Visual Mode
keymap("n", "<Down>", "<Nop>", "• Disable: Arrow Down on Normal Mode")
keymap("n", "<Left>", "<Nop>", "• Disable: Arrow Left on Normal Mode")
keymap("n", "<Right>", "<Nop>", "• Disable: Arrow Right on Normal Mode")
keymap("n", "<Up>", "<Nop>", "• Disable: Arrow Up on Normal Mode")

keymap("v", "<Down>", "<Nop>", "• Disable: Arrow Down on Visual Mode")
keymap("v", "<Left>", "<Nop>", "• Disable: Arrow Left on Visual Mode")
keymap("v", "<Right>", "<Nop>", "• Disable: Arrow Right on Visual Mode")
keymap("v", "<Up>", "<Nop>", "• Disable: Arrow Up on Visual Mode")

-- -------------------------------------------------------
-- Indentation Keymaps
-- -------------------------------------------------------

-- Improve Indentation in Visual Mode
keymap("v", "<", "<gv", "• Indenting: Shift left")
keymap("v", ">", ">gv", "• Indenting: Shift right")

-- -------------------------------------------------------
-- Other Keymaps
-- -------------------------------------------------------

-- Yank to the end of the line
keymap("n", "Y", "y$", "• Yank: Yank to the end of the line")

-- Map for Exit from Insert Mode
keymap("i", "jk", "<Esc>", "• Exit: Exit insert mode")
keymap("i", "jj", "<Esc>", "• Exit: Exit insert mode")
keymap("i", "kk", "<Esc>", "• Exit: Exit insert mode")
keymap("i", "kj", "<Esc>", "• Exit: Exit insert mode")
