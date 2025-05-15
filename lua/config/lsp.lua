-- ╭─────────────────────────────────────────────────────╮
-- │ LSP Bootstrap                                       │
-- ╰─────────────────────────────────────────────────────╯

local M = {}

M.servers = {
	ts_ls = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayFunctionParameterTypeHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayFunctionParameterTypeHints = true,
				},
			},
		},
	},
	marksman = {}, -- Markdown LSP
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	},
}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set

	-- Mapeamentos básicos do LSP
	keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap("n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	require("lsp_signature").on_attach({}, bufnr)
end

M.setup = function(opts)
	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	for server, config in pairs(M.servers) do
		lspconfig[server].setup(vim.tbl_deep_extend("force", {
			on_attach = M.on_attach,
			capabilities = capabilities,
		}, config))
	end
end

return M
