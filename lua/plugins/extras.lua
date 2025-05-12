return {
	{
		"stevearc/oil.nvim",
		cmd = { "Oil", "OilOpen" },
		keys = {
			{
				"<Leader>E",
				function()
					require("oil").toggle_float()
				end,
				desc = "• File Explorer: Open Oil",
			},
		},
		opts = {
			columns = { "icon" },
			view_options = { show_hidden = true },
			float = {
				winblend = 10,
				border = "single",
				width = 0.6,
				height = 0.6,
				highlights = {
					border = "rounded",
					background = "Normal",
				},
			},
		},
	},
}
