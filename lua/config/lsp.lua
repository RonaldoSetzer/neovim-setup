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
