
return {
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

		keys = {
			{
				"<Leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "• Refactor: Format current buffer with Conform",
			},
		},
	}
}
