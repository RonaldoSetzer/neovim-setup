# Neovim Setup

## TODO
- [ ] Setup Null-ls to handle with format
- [ ] Setup Dap to add debug supports

## Core
- package-manager
- autocomplete
- language-syntax
- fuzzy-finder
- language-server

## IDE features
- Statup page
- Statusbar
- DevIcons support
- hexcolor
- File Tree
- Project Management
- Git support
- Lint diagnostic support
- Fancy notification

## Custom mappings
- \<space\>: leader key
- jj, jk, kk, kj: Back to normal mode
- \<C-s\>: Save current file
- <leader>w: Close current buffer
- <leader>W: Close all buffers
- <C-h>,<C-j>, <C-k>, <C-l>: Window navigation
- <TAB>, <S-TAB>: Swtich between buffers

### Package Manager

- This setup uses [packer.nvim](https://github.com/wbthomason/packer.nvim) as a plugin manager
- All plugins are setup on the `lua/core/package-manager.lua` file
- There is a auto-setup script when you open neovim in the first 16:28
- There is a auto-command to install and update the plugins after save the file

### Autocomplete

- the completion engine is [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

#### Completion plugins
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](http://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](http://github.com/hrsh7th/cmp-cmdline)
- [cmp_luasnip](http://github.com/saadparwaiz1/cmp_luasnip)
- [cmp-nvim-lsp](http://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](http://github.com/hrsh7th/cmp-nvim-lua)

#### Snippets engines

- [copilot.vim](http://github.com/github/copilot.vim)
- [LuaSnip](http://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](http://github.com/rafamadriz/friendly-snippets)

### Language-syntax

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### plugins

- [nvim-ts-context-commentstring](https://github.com/nvim-treesitter/nvim-treesitter)
- [Playground](https://github.com/nvim-treesitter/playground)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)


### fuzzy-finder
- [Telescope](https://github.com/nnvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nnvim-telescope/telescope-fzf-native.nvim)


### language-server
As a language-server engine, the setup uses lsp and mason as language installer

LspSaga provides code action `<leader> ca`

- [nvim-lspconfig](https://github.com/nneovim/nvim-lspconfig)
- [mason.nvim](https://github.com/nwilliamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/nwilliamboman/mason-lspconfig.nvim)
- [lspsaga.nvim](https://github.com/ntami5/lspsaga.nvim)
