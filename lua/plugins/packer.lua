-- stardate (05 - 19 -2022)
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
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require 'plugins.lualine'
    end
  }

  -- cmp plugins
  use {"hrsh7th/nvim-cmp", commit = "bba6fb67fdafc0af7c5454058dfbabc2182741f4"} -- The completion plugin (May 2)
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use {"saadparwaiz1/cmp_luasnip", commit = "75fa4e5dd4941407bb25e274953d8ea581e8b459"} -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use {"L3MON4D3/LuaSnip", commit = "50760912f54dfd0087b29abef6ede39c33615ab9"} -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Navigation
  use {"nvim-telescope/telescope.nvim", tag = "nvim-0.6"}
  use {'kyazdani42/nvim-tree.lua', commit = "90d7b8edb1d715086b34572a0fb742faf23a271b"} -- (may 14)
  use 'goolord/alpha-nvim'
  use "ahmedkhalf/project.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "b4ab9daed1f144200e826a656bd25b013f0949eb"
  }
  use {"nvim-treesitter/playground", commit = "13e2d2d63ce7bc5d875e8bdf89cb070bc8cc7a00"}
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- LSP (Language Server Protocol)
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use {'tami5/lspsaga.nvim'}
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters agnd linters

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive" -- Vimscript

  -- Diagnostic
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }
  use {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  }

  -- Utils
  use {"numToStr/Comment.nvim", tag = "v0.6"}
  use "tpope/vim-surround"
  use "tpope/vim-eunuch"
  use "vimwiki/vimwiki"

  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
