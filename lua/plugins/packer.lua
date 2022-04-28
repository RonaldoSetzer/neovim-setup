local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end
  }
}

return packer.startup(function(use)
  -- Dependency
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Appearance
  use {
    "dragon-themes/kaiser.vim",
    config = function()
      vim.cmd('colorscheme kaiser')
    end
  }
  use "lukas-reineke/indent-blankline.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "nvim-0.6"
  }

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "nvim-treesitter/playground"

  -- LSP (Language Server Protocol)
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use {'tami5/lspsaga.nvim'}

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      vim.cmd [[ highlight GitSignsChange guifg=#b8bb26 guibg=#3c3836 ]]
      vim.cmd [[ highlight GitSignsAdd guifg=#8ec07c guibg=#3c3836 ]]
      vim.cmd [[ highlight GitSignsDelete guifg=#fe8019 guibg=#3c3836 ]]
    end
  }
  use "tpope/vim-fugitive" -- Vimscript


  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
