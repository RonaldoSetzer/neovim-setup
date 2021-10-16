-- Lua
local luaFormatter = {
  formatCommand = 'lua-format -i --no-keep-simple-function-one-line --column-limit=120 --indent-width=2 --double-quote-to-single-quote',
  formatStdin = true
}
local lua_settings = {luaFormatter}

-- TSServer
local prettier = {formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}', formatStdin = true}

-- Lints
local eslint = {
  lintCommand = './node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  formatCommand = './node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true
}

-- Language settings
local tsserver_settings = {prettier, eslint}

require'lspconfig'.efm.setup {
  cmd = {DATA_PATH .. '/lspinstall/efm/efm-langserver'},
  init_options = {
    documentFormatting = true, -- enable vim.lsp.buf.formatting()
    codeAction = false
  },
  filetypes = {
    'lua', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'yaml', 'html', 'css', 'scss',
    'xml', 'vue'
  },
  settings = {
    rootMarkers = {'.git/'},
    languages = {
      lua = lua_settings,
      javascript = tsserver_settings,
      javascriptreact = tsserver_settings,
      typescript = tsserver_settings,
      typescriptreact = tsserver_settings,
      vue = tsserver_settings,
      json = {prettier},
      xml = {prettier},
      yaml = {prettier},
      html = {prettier},
      css = {prettier},
      scss = {prettier}
    }
  }
}
