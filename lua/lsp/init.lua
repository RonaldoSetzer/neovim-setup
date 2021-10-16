vim.fn.sign_define('LspDiagnosticsSignError',
                   {texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError'})
vim.fn.sign_define('LspDiagnosticsSignWarning',
                   {texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning'})
vim.fn.sign_define('LspDiagnosticsSignHint',
                   {texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint'})
vim.fn.sign_define('LspDiagnosticsSignInformation',
                   {texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation'})

local keymapOpt = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keymapOpt)
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', keymapOpt)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keymapOpt)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keymapOpt)
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', keymapOpt)

local function addReferencesHighlight(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_references_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local function addAutoFormatOnSave(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup lsp_auto_format_on_save
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
      augroup END
    ]], false)
  end
end

local lsp_config = {}

function lsp_config.default_on_attach(client, bufnr)
  client.resolved_capabilities.document_highlight = SETTINGS.lsp.referencesHighlight
  client.resolved_capabilities.document_formatting = SETTINGS.lsp.autoFormatOnSave;
  require'lsp_signature'.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {border = 'single'}
  }, bufnr)
  addReferencesHighlight(client)
  addAutoFormatOnSave(client)
end

return lsp_config
