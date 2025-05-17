-- ╭─────────────────────────────────────────────────────╮
-- │ LSP Bootstrap                                       │
-- ╰─────────────────────────────────────────────────────╯

local M = {}

M.servers = {
	ts_ls = {
		root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
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
	marksman = {},
	lua_ls = {
		root_dir = require("lspconfig.util").root_pattern(".git", "init.lua"),
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
					disable = { "unused-local", "lowercase-global" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	},
}

M.on_attach = function(client, bufnr)
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	for _, existing_client in ipairs(clients) do
		if existing_client.name == client.name and existing_client.id ~= client.id then
			vim.notify("Desanexando cliente duplicado: " .. client.name, vim.log.levels.WARN)
			vim.lsp.stop_client(client.id)
			return
		end
	end

	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set

	keymap("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
	keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap("n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	require("lsp_signature").on_attach({}, bufnr)
end

M.diagnostic = function()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "❯ ",
			source = false,
			severity = {
				min = vim.diagnostic.severity.WARN,
			},
		},
		severity_sort = true,
		float = {
			border = "rounded",
			source = false,
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "✖",
				[vim.diagnostic.severity.WARN] = "⚠",
				[vim.diagnostic.severity.INFO] = "ℹ",
				[vim.diagnostic.severity.HINT] = "",
			},
		},
	})
end

M.setup = function(opts)
	M.diagnostic()

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
