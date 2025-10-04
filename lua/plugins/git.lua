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
			{ "]g", ":Gitsigns next_hunk<CR>", desc = "Next Hunk" },
			{ "[g", ":Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
			{ "Kg", ":Gitsigns preview_hunk_inline<CR>", desc = "Preview Hunk" },
			{ "<Leader>gb", ":Gitsigns blame_line<CR>", desc = "Blame Line" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "LazyGit",
		keys = {
			{ "<Leader>G", "<Cmd>LazyGit<CR>", desc = "Abrir LazyGit" },
			{ "<Esc><Esc>", "<Cmd>q<CR>", mode = "t", desc = "Fechar LazyGit" },
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<Leader>gg", "<Cmd>vert Git<CR>", desc = "• Git: Open Git status" },
		},
	},
}
