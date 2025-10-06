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
		keys = {
			{ "ld", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "LSP: Go to Definition" },
			{ "lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "LSP: Go to Declaration" },
			{ "li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", desc = "LSP: Go to Implementation" },
			{ "lK", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "LSP: Signature Help" },
			{ "lr", "<Cmd>lua vim.lsp.buf.references()<CR>", desc = "LSP: List References" },
			{ "lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "LSP: Hover Documentation" },
			{ "<Leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", desc = "LSP: Rename Symbol" },
			{ "<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", desc = "LSP: Code Action" },
			{ "<Leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", desc = "LSP: Format Document" },
			{ "<Leader>ls", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc = "LSP: Workspace Symbol" },
			{ "<Leader>ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", desc = "LSP: Show Line Diagnostics" },
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
				astro = { "prettier" },
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
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		config = function()
			require("config.ui").indent()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-context",
		},
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"css",
				"dockerfile",
				"go",
				"graphql",
				"html",
				"javascript",
				"json",
				"json5",
				"lua",
				"markdown",
				"regex",
				"scss",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
				"vimdoc",
				"query",
				"markdown_inline",
				"astro",
			},
			auto_install = false,
			indent = {
				enable = true,
				disable = { "yaml" },
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["[f"] = "@function.outer",
						["[i"] = "@conditional.outer",
						["[s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
						["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_previous_start = {
						["]f"] = "@function.outer",
						["]i"] = "@conditional.outer",
						["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next = {
						["[F"] = "@function.outer",
						["[I"] = "@conditional.outer",
						["[S"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
						["[Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_previous = {
						["]F"] = "@function.outer",
						["]I"] = "@conditional.outer",
						["]S"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
						["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						["is"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						["az"] = { query = "@fold", query_group = "folds", desc = "Select language fold" },
						["iz"] = { query = "@fold", query_group = "folds", desc = "Select language fold" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"jxnblk/vim-mdx-js",
		ft = { "mdx" },
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			pre_hook = function()
				return vim.bo.commentstring
			end,
		},
	},
}
