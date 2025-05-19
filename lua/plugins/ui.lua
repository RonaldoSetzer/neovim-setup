return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_enable_italic = 1
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			require("config.ui").indent()
		end,
	},
		{
		"echasnovski/mini.cursorword",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 100,
		},
	},
	{
		"echasnovski/mini.icons",
		lazy = false,
		opts = {
			style = "glyphs",
		},
	},
	{
		"echasnovski/mini.statusline",
		event = "VeryLazy",
		config = function()
			require("config.ui").statusline()
		end,
	},
}
