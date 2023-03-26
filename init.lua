local status_ok = pcall(require, "impatient")
if status_ok then require "impatient" end
require "settings.options"
require "settings.mappings"
require "core"
require "plugins"

vim.cmd('colorscheme agni')

-- Adjust colorscheme
--[[ vim.cmd('hi Normal ctermbg=NONE guibg=NONE') -- to add background transparent ]]
-- MOVE TO RUDRA THEME
vim.cmd('hi! link TelescopePromptPrefix Operator') -- by defaylt is linking with Identifier which uses italic but there are no italic devicon
vim.cmd('hi! link JsonCommentError Comment')       -- to fix jsonc comment color
vim.cmd('hi! link JsonNoQuotesError Comment')      -- to fix jsonc comment color
