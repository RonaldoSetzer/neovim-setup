vim.g.vimwiki_list = {{path = '~/Documents/vimwiki/', syntax = 'markdown', ext = '.md'}}

-- local vw_pickers = require 'telescope._extensions.vimwiki.pickers'
--
-- return require'telescope'.register_extension {
--   exports = {
--     vimwiki = vw_pickers.vimwiki_pages,
--     live_grep = vw_pickers.vimwiki_grep,
--     link = vw_pickers.vimwiki_link
--   }
-- }

-- nnoremap <leader>vrc :lua require('setzer.telescope').search_dotfiles()<CR>
-- nnoremap <leader>fw :lua require('setzer.telescope').search_wikifiles()<CR>
