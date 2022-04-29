local M = {}

-- TODO: backfill this to template
vim.cmd [[ highlight DiagnosticSignHint guifg=#b8bb26 guibg=#3c3836 ]]
vim.cmd [[ highlight DiagnosticSignInfo guifg=#b8bb26 guibg=#3c3836 ]]
vim.cmd [[ highlight DiagnosticSignWarn guifg=#8ec07c guibg=#3c3836 ]]
vim.cmd [[ highlight DiagnosticSignError guifg=#fe8019 guibg=#3c3836 ]]
M.setup = function()
  local signs = {
    {name = "DiagnosticSignError", text = " ✖"}, {name = "DiagnosticSignWarn", text = " ⚠"},
    {name = "DiagnosticSignHint", text = " "}, {name = "DiagnosticSignInfo", text = " ℹ"}
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {active = signs},
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

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp
                                               .with(vim.lsp.handlers.hover, {border = "rounded"})

  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})
end

-- I think that its is not working
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local function lsp_keymaps(bufnr)
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Diagnostic
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d",
                              '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d",
                              '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

  -- LSP SAGA
  vim.api.nvim_buf_set_keymap(bufnr, "n", "Kf",
                              "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
                              "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "Kd",
                              "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
                              opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca",
                              "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rr",
                              "<cmd>lua require'lspsaga.rename'.rename()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  -- vim.apgi.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

  -- Git Signs
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", "<cmd>lua require'gitsigns'.prev_hunk()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", "<cmd>lua require'gitsigns'.next_hunk()<CR>", opts)

  -- Format
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>",
                              opts)

end

M.on_attach = function(client, bufnr)
  if client.name == "sumneko_lua" then client.resolved_capabilities.document_formatting = false end

  if client.name == "tsserver" then client.resolved_capabilities.document_formatting = false end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
