-- ╭─────────────────────────────────────────────────────╮
-- │  Settings Options                                   │
-- ╰─────────────────────────────────────────────────────╯

local opt = vim.opt

-- -------------------------------------------------------
-- Geral
-- -------------------------------------------------------

opt.title         = true
opt.termguicolors = true
opt.mouse         = 'a'
opt.clipboard     = 'unnamedplus'

-- -------------------------------------------------------
-- Busca
-- -------------------------------------------------------

opt.ignorecase = true
opt.smartcase  = true
opt.showmatch  = true

-- -------------------------------------------------------
-- Completions & UX
-- -------------------------------------------------------

opt.completeopt = { 'menu', 'menuone', 'preview', 'noselect', 'noinsert' }
opt.pumheight   = 10
opt.updatetime  = 300
opt.cmdheight   = 1
opt.showmode    = false

-- -------------------------------------------------------
-- Interface
-- -------------------------------------------------------

opt.number       = true
opt.cursorline   = true
opt.wrap         = true
opt.linebreak    = true
opt.breakindent  = true
opt.signcolumn   = 'yes'
opt.colorcolumn  = '100'
opt.showtabline  = 0
opt.scrolloff    = 10

-- -------------------------------------------------------
-- Splits
-- -------------------------------------------------------

opt.splitright = true
opt.splitbelow = true

-- -------------------------------------------------------
-- Indentação
-- -------------------------------------------------------

opt.expandtab   = true
opt.tabstop     = 2
opt.shiftwidth  = 2
vim.bo.smartindent = true

-- -------------------------------------------------------
-- Arquivos temporários
-- -------------------------------------------------------

opt.backup      = false
opt.writebackup = false
opt.swapfile    = false

-- -------------------------------------------------------
-- Folding
-- -------------------------------------------------------

opt.foldmethod  = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel  = 99
opt.foldlevelstart = 99

-- -------------------------------------------------------
-- Desativa netrw (usando nvim-tree/mini.files/etc)
-- -------------------------------------------------------

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
