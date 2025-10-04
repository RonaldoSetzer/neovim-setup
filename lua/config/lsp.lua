-- ╭─────────────────────────────────────────────────────╮
-- │ LSP Bootstrap                                       │
-- ╰─────────────────────────────────────────────────────╯

local M = {}
local ts_sdk_path = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"

M.servers = {

	ts_ls = {
		cmd = { "typescript-language-server", "--stdio" },
		root_dir = function(fname)
			local util = require("lspconfig.util")
			return util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", "pnpm-workspace.yaml")(fname)
		end,
		settings = {
			typescript = {
				preferGoToSourceDefinition = true,
				importModuleSpecifierPreference = "relative",
				tsdk = ts_sdk_path,
				referencesCodeLens = {
					enabled = true,
					showOnAllFiles = true,
				},
			},
		},
		flags = {
			debounce_text_changes = 150,
		},
		init_options = {
			preferences = {
				disableSuggestions = false,
			},
			tsserver = {
				useSyntaxServer = "never",
				maxTsServerMemory = 4096,
				enableProjectDependencies = true,
			},
		},
	},
	astro = {
		cmd = { "astro-ls", "--stdio" },
		filetypes = { "astro" },
		root_dir = require("lspconfig.util").root_pattern(
			"astro.config.mjs",
			"astro.config.ts",
			"package.json",
			".git"
		),
		init_options = {
			typescript = {
				tsdk = ts_sdk_path,
				enableProjectDependencies = true,
			},
		},
		settings = {
			typescript = {
				tsdk = ts_sdk_path,
			},
			diagnostic = {
				ignoredCodes = {
					2306, -- File is not a module
					2307, -- File is not a module
				},
			},
			astro = {
				typescript = {
					tsdk = ts_sdk_path,
				},
				preferences = {
					disableSuggestions = false,
					suggest = {
						autoImports = true,
						completeFunctionCalls = true,
					},
				},
			},
		},
	},
	-- volar = {
	--    root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
	-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json", "mdx" },
	-- },
	-- ts_ls = {
	-- 	root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
	-- 	settings = {
	-- 		typescript = {
	-- 			inlayHints = {
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 			},
	-- 		},
	-- 		javascript = {
	-- 			inlayHints = {
	-- 				includeInlayFunctionParameterTypeHints = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
	marksman = {
		filetypes = { "markdown", "markdown.mdx", "mdx" },
		root_dir = require("lspconfig.util").root_pattern(".obsidian", ".git"),
	},
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

	if client.server_capabilities.semanticTokensProvider then
		client.server_capabilities.semanticTokensProvider = nil
	end

	if client.name == "ts_ls" or client.name == "jsonls" or client.name == "cssls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name ~= "marksman" then
		require("lsp_signature").on_attach({}, bufnr)
	end
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
