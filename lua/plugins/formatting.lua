
return {
  {
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt" },
					typescript = { "prettier" },
					javascript = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
					json = { "jq" },
				},
			})

			local utils = require("core.utils")
			utils.keymap("n", "<Leader>cf", function()
				require("conform").format({ async = true, lsp_fallback = true })
			end, "• Refactor: Format current buffer with Conform")
		end,
	}
}
