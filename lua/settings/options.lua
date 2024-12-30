vim.cmd('set shortmess+=c')
vim.o.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.o.termguicolors = true
vim.o.title = true      -- change the terminal's title
vim.o.smartcase = true  -- "Smart case search if there is uppercase
vim.o.ignorecase = true -- "case insensitive search
vim.o.showmatch = true  -- "Highlight matching bracket
vim.o.mouse = 'a'       -- "Enable mouse usage
vim.o.scrolloff = 10
vim.o.clipboard = 'unnamed'
vim.o.showtabline = 0
vim.o.expandtab = true       -- "Use spaces for indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2         -- "Use 2 spaces for indentation
vim.o.pumheight = 10         -- Makes popup menu smaller
vim.o.cmdheight = 2          -- More space for displaying messages
vim.o.showmode = false       -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false         -- "Enable saving swap file
vim.o.writebackup = false    -- Disable writing backup file
vim.o.swapfile = false       -- Enable creating swap file
vim.o.updatetime = 300       -- Faster completion
vim.o.splitright = true      -- "Split to the right

vim.bo.smartindent = true    -- "Use smarter indenting

vim.wo.number = true         -- Line numbers are good
vim.wo.cursorline = true     -- Highlight current line
vim.wo.wrap = true           -- Enable word wrap
vim.wo.linebreak = true      -- "Wrap lines at convenient points
vim.wo.breakindent = true    -- "Preserve indent on line wrap
vim.wo.signcolumn = 'yes'
vim.wo.colorcolumn = '100'   -- "Highlight 100th column for easier wrapping
vim.wo.foldmethod = 'syntax' -- "When folding enabled, use syntax method

vim.g.loaded_netrw = 1       -- To prevent netrw from loading
vim.g.loaded_netrwPlugin = 1 -- To prevent netrwPlugin from loading
