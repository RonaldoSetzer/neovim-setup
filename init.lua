local status_ok = pcall(require, "impatient")
if status_ok then require "impatient" end
require "settings.options"
require "settings.mappings"
require "core"
require "plugins"

vim.cmd('colorscheme kaiser')

-- Adjust colorscheme
--[[ vim.cmd('hi Normal ctermbg=NONE guibg=NONE') -- to add background transparent ]]
