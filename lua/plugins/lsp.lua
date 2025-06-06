return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"ray-x/lsp_signature.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
						{ "nvim-dap-ui" },
					},
				},
			},
		},
		opts = function()
			return require("config.lsp")
		end,
		config = function(_, opts)
			require("mason").setup()
			require("config.lsp").setup(opts)
		end,
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
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				go = { "gofmt" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				json = { "jq" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.lua",
				callback = function()
					require("conform").format({ async = false })
				end,
			})
		end,
		keys = {
			{
				"<Leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "• Refactor: Format current buffer with Conform",
			},
		},
	},
}
