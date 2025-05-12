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
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPost" },
	{ 
		"echasnovski/mini.icons", 
		lazy = false,
		opts = {
			style = "glyphs",
		}
	},
}
