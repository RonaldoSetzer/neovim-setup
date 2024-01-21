-- stardate (01 - 20 -2024)
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
    autocmd BufWritePost package-manager.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)
  -- Dependency
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Appearance
  use "dragon-themes/neovim"
  use "lukas-reineke/indent-blankline.nvim"
  use "kyazdani42/nvim-web-devicons"
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "plugins.lualine"
    end
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp"         -- The completion plugin (May 2)
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "github/copilot.vim"
  use "L3MON4D3/LuaSnip"             -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Navigation
  use {
    "nvim-telescope/telescope.nvim",
    version = "*",
    requires = { "plenary.nvim" }
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function()
    return vim.fn.executable "make" ==
        1
  end }
  use "kyazdani42/nvim-tree.lua" -- (may 14)
  use "goolord/alpha-nvim"
  use "ahmedkhalf/project.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/playground"
    }
  }
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- LSP (Language Server Protocol)
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "tami5/lspsaga.nvim"
    },
  }

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
      vim.notify.setup({
        background_colour = "#000000",
      })
    end
  }

  -- Utils
  use "numToStr/Comment.nvim"
  use "tpope/vim-surround"
  use "tpope/vim-eunuch"
  use "lewis6991/impatient.nvim" -- improve startup

  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
