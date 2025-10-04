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
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		opts = {
			"*",
			css = { rgb_fn = true },
		},
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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = {
					enabled = true,
				},
				hover = {
					enabled = false, -- Deixe o `lspsaga` gerenciar hover
				},
				signature = {
					enabled = false, -- Deixe o `lsp_signature` gerenciar assinatura
				},
			},
			presets = {
				inc_rename = false, -- Use o `lspsaga` para renomeação
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
					},
					opts = { skip = true },
				},
			},
		},
	},
}
