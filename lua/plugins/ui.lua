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
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		opts = {
			"*",
			css = { rgb_fn = true },
		},
	},
	{
		"folke/lsp-colors.nvim",
		event = "LspAttach",
		config = function()
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FB4934", bg = "#282828" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#FE8019", bg = "#282828" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#83A598", bg = "#282828" })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#8EC07C", bg = "#282828" })
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
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
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
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		event = "LspAttach",
		opts = {
			hover = true,
			symbol_in_winbar = {
				enable = false,
			},
			diagnostic = {
				show_code_action = true,
				show_source = true,
				border = "rounded",
				severity_sort = true,
			},
			lightbulb = {
				enable = false,
				sign = true,
			},
			rename = {
				in_select = false,
			},
			outline = {
				win_position = "right",
				win_with = "",
				win_width = 40,
			},
		},
		keys = {
			{ "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
			{ "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic" },
			{ "<Leader>ca", "<Cmd>Lspsaga code_action<CR>", desc = "Code Action" },
			{ "<Leader>d", "<Cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
			{ "K", "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
			{ "Kd", "<Cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" },
			{ "gd", "<Cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
			{ "gD", "<Cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "rr", "<Cmd>Lspsaga rename<CR>", desc = "Rename" },
			{ "gf", "<Cmd>Lspsaga finder<CR>", desc = "Finder" },
			{ "<Leader>o", "<Cmd>Lspsaga outline<CR>", desc = "Outline" },
			{ "<Leader>t", "<Cmd>Lspsaga term_toggle<CR>", desc = "Toggle Terminal" },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("lsp_signature").setup({
				bind = true,
				floating_window = true,
				hint_enable = false,
				handler_opts = { border = "rounded" },
			})
		end,
	},
}
