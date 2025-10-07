return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
		keys = {
			{ "]g", ":Gitsigns next_hunk<CR>", desc = "• Git: Jump to the next Git hunk in the buffer" },
			{ "[g", ":Gitsigns prev_hunk<CR>", desc = "• Git: Jump to the previous Git hunk in the buffer" },
			{ "Kg", ":Gitsigns preview_hunk_inline<CR>", desc = "• Git: Preview the current Git hunk inline" },
			{ "<Leader>gb", ":Gitsigns blame_line<CR>", desc = "• Git: Show Git blame for the current line" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "LazyGit",
		keys = {
			{ "<Leader>G", "<Cmd>LazyGit<CR>", desc = "• Git: Open LazyGit interface" },
			{ "<Esc><Esc>", "<Cmd>q<CR>", mode = "t", desc = "• Git: Close LazyGit interface" },
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<Leader>gg", "<Cmd>tab Git<CR>", desc = "• Git: Open Git status in a new tab" },
		},
	},
}
