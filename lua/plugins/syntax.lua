return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPost", "BufNewFile" },
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
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			pre_hook = function()
				return vim.bo.commentstring
			end,
		},
	},
}
