require "impatient"
require "settings.options"
require "settings.mappings"
require "plugins.packer"
require "plugins.cmp"
require "plugins.treesitter"
require "plugins.telescope"
require "plugins.gitsigns"
require "plugins.indent-blankline"
require "plugins.nvim-tree"
require "plugins.autopairs"
require "plugins.comment"
require "plugins.alpha"
require "plugins.project"
require "plugins.vimwiki"
require "lsp"
vim.cmd('colorscheme Rudra')

-- Adjust colorscheme
vim.cmd('hi Normal guibg=none') -- to add background transparent
vim.cmd('hi! link TelescopePromptPrefix Operator') -- by defaylt is linking with Identifier which uses italic but there are no italic devicon
