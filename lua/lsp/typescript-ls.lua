require'lspconfig'.tsserver.setup {
  cmd = {DATA_PATH .. '/lspinstall/typescript/node_modules/.bin/typescript-language-server', '--stdio'},
  filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'},
  on_attach = require'lsp'.default_on_attach,
  root_dir = require('lspconfig/util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
