local M = {}

function M.vimwiki()
  local opts = {}
  opts.search_dirs = { '~/Workspace/documents/vimwiki' }
  opts.prompt_title = 'vimwiki'
  require 'telescope.builtin'.live_grep(opts)
end

return M

