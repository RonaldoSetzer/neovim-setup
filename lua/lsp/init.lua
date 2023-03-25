local status_ok, _ = pcall(require, "mason")
if not status_ok then return end

require('mason').setup()
require('mason-lspconfig').setup()

local signs = {
  { name = "DiagnosticSignError", text = " ✖" }, { name = "DiagnosticSignWarn", text = " ⚠" },
  { name = "DiagnosticSignHint", text = " " }, { name = "DiagnosticSignInfo", text = " ℹ" }
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
      diagnostics = { globals = {"vim"} },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Diagnostic
  nmap("[d", vim.diagnostic.goto_prev, 'Previous Diagnostic')
  nmap("]d", vim.diagnostic.goto_next, 'Next Diagnostic')

  -- LSP SAGA
  nmap("Kf", require('lspsaga.provider').lsp_finder, 'LSP Finder')
  nmap("K", require('lspsaga.hover').render_hover_doc, 'Hover Documentation')
  nmap("Kd", require'lspsaga.diagnostic'.show_line_diagnostics, 'Line Diagnostics')
  nmap("<leader>ca", require'lspsaga.codeaction'.code_action, 'Code Action')
  nmap("<leader>rr", require'lspsaga.rename'.rename, 'Rename')

  -- Git Signs
  nmap("[g", require'gitsigns'.prev_hunk, 'Previous Git Hunk')
  nmap("]g", require'gitsigns'.next_hunk, 'Next Git Hunk')
  --
  -- Format
  nmap("<leader>p", vim.lsp.buf.format, 'Format')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
-- From old config
--if client.name == "sumneko_lua" then client.server_capabilities.document_formatting = false end
--if client.name == "tsserver" then client.server_capabilities.document_formatting = false end
--if client.name == "gopls" then client.server_capabilities.document_formatting = false end


-- From old config - Add json helpers
-- if server.name == "jsonls" then
--   local jsonls_opts = require("lsp.settings.jsonls")
--   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- end
