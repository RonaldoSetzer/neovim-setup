local status_ok, _ = pcall(require, "mason")
if not status_ok then return end

require('mason').setup()
require('mason-lspconfig').setup()

local signs = {
  { name = "DiagnosticSignError", text = " ✖" },
  { name = "DiagnosticSignWarn",  text = " ⚠" },
  { name = "DiagnosticSignHint",  text = " " },
  { name = "DiagnosticSignInfo",  text = " ℹ" }
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = { active = signs },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = ""
  }
}
-- TODO: Fix all border issues
vim.diagnostic.config(config)

local servers = {
  gopls = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Refactor
  nmap("<leader>ca", require 'lspsaga.codeaction'.code_action, '• Refactor: Code Action')
  nmap("<leader>rr", require 'lspsaga.rename'.rename, '• Refactor: Rename')
  nmap("<leader>p", vim.lsp.buf.format, '• Refactor: Format current buffer with LSP')

  -- Navigation
  nmap('gd', vim.lsp.buf.definition, '• Navigation: Goto Definition')
  nmap('gr', require 'telescope.builtin'.lsp_references, '• Navigation: List all References')
  nmap('<leader>ds', require 'telescope.builtin'.lsp_document_symbols, '• Navigation: list all Document Symbols')
  nmap("[d", vim.diagnostic.goto_prev, '• Navigation: Goto Previous Diagnostic')
  nmap("]d", vim.diagnostic.goto_next, '• Navigation: Goto Next Diagnostic')
  nmap("[g", require 'gitsigns'.prev_hunk, '• Navigation: Goto Previous Git Hunk')
  nmap("]g", require 'gitsigns'.next_hunk, '• Navigation: Goto Next Git Hunk')

  -- Hover Documentation
  nmap("K", require 'lspsaga.hover'.render_hover_doc, '• Documentation: Hover Documentation')
  nmap("Kr", require 'lspsaga.provider'.lsp_finder, '• Documentation: LSP Finder')
  nmap("Kd", require 'lspsaga.diagnostic'.show_line_diagnostics, '• Documentation: Line Diagnostics')

  -- workspace
  nmap('<leader>ws', require 'telescope.builtin'.lsp_dynamic_workspace_symbols,
    '• Workspace Navigation: Search Workspace Symbols')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '• Workspace Refactor: Remove Folder')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '• Workspace Refactor: Add Folder')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
--[[ client.server_capabilities.semanticTokensProvider = nil ]]
-- From old config
--if client.name == "sumneko_lua" then client.server_capabilities.document_formatting = false end
--if client.name == "tsserver" then client.server_capabilities.document_formatting = false end
--if client.name == "gopls" then client.server_capabilities.document_formatting = false end

-- From old config - Add json helpers
-- if server.name == "jsonls" then
--   local jsonls_opts = require("lsp.settings.jsonls")
--   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- end

-- Lesser used LSP functionality
--[[ nmap('<leader>D', vim.lsp.buf.type_definition, 'LSP: Type [D]efinition') ]]
--[[ nmap('gI', vim.lsp.buf.implementation, 'LSP: [G]oto [I]mplementation') -- Show a list of implementations in quick list ]]
--[[ nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration') ]]
--[[ nmap('<leader>wl', function() ]]
--[[   print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
--[[ end, 'LSP: [W]orkspace [L]ist Folders') ]]
--[[ nmap('<C-k>', vim.lsp.buf.signature_help, 'LSP: Signature Documentation') ]]
-- Replaced by lspsaga
--[[ nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[n]ame') ]]
-- Replaced by lspsaga
--[[ nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction') ]]
-- Replaced by lspsaga
--[[ nmap('K', vim.lsp.buf.hover, 'LSP: Hover Documentation') ]]
-- Replaced by lspsaga
