return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
      "ray-x/lsp_signature.nvim", -- Signature helper integrado
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = function()
			return require("config.lsp")
		end,
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls", "marksman" }, -- Lista de servidores que devem estar instalados
				automatic_installation = true,
			})
			require("config.lsp").setup(opts)
		end,
	},
}
