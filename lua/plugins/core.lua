return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		opts = {
			dashboard = {
				enabled = true,
				preset = {
					header = require("core.pixels").spaceinvaders,
					keys = {
						{ icon = "󰱼 ", key = "f", desc = "Find file", action = "<Cmd>Telescope find_files<CR>" },
						{ icon = "󰍉 ", key = "t", desc = "Find text", action = "<Cmd>Telescope live_grep<CR>" },
						{ icon = " ", key = "p", desc = "Find project", action = "<Cmd>Telescope projects<CR>" },
						{ icon = " ", key = "g", desc = "Git", action = "<Cmd>tab Git<CR>" },
						{ icon = " ", key = "G", desc = "LazyGit", action = "<Cmd>LazyGit<CR>" },
					},
				},
				formats = {
					footer = { "Santiago.d.Ronaldo", align = "center" },
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						items = {
							{ desc = "Santiago.d.Ronaldo" },
						},
						gap = 1,
						padding = 1,
						align = "center",
					},
				},
			},
			explorer = { enabled = true },
		},
		keys = {
			{
				"<Leader>e",
				"<Cmd>lua Snacks.explorer()<CR>",
				desc = "• File Explorer: Toggle Snacks.explorer to browse project files",
			},
		},
	},
	{ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },
	{ "christoomey/vim-tmux-navigator", keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" } },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-eunuch", cmd = { "Rename", "Move", "Delete", "Mkdir", "Chmod" } },
}
