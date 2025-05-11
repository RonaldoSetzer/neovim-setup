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
  ts_ls = {},
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

require ('lspsaga').setup({
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
})

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Refactor
  nmap("<leader>ca", '<CMD>Lspsaga code_action<CR>', '• Refactor: Code Action')
  nmap("<leader>rr", '<CMD>Lspsaga rename<CR>', '• Refactor: Rename')
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
  nmap("K", '<CMD>Lspsaga hover_doc<CR>', '• Documentation: Hover Documentation')
  nmap("Kr", '<CMD>Lspsaga finder<CR>', '• Documentation: LSP Finder')
  nmap("Kd", '<CMD>Lspsaga show_cursor_diagnostics<CR>', '• Documentation: Line Diagnostics')

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
