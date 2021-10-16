local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Apparence -------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins-config/nvim-treesitter')
    end
  }
  use 'nvim-treesitter/playground'
  use 'dragon-themes/kaiser.vim'
  use 'RonaldoSetzer/gruvbox'
  use 'RonaldoSetzer/palenight.vim'
  use {'dracula/vim', as = 'dracula'}
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use({
    'NTBBloodbath/galaxyline.nvim',
    -- your statusline
    config = function()
      require('galaxyline.themes.neonline')
    end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  })
  -- IDE -------------------------------------
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require'nvim-tree'.setup {}
      require('plugins-config/nvim-tree')
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins-config/nvim-autopairs')
    end
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()

      require('nvim-ts-autotag').setup()
    end
  }
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
  use 'tpope/vim-surround' -- vimscript
  use 'tpope/vim-repeat' -- vimscript, allow repeat surround with .

  -- Commands --------------------------------
  use 'tpope/vim-eunuch'

  -- Telescope -------------------------------
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins-config/telescope')
      require('telescope-customs')
      require('plugins-config/telescope-customs')
    end
  }

  -- Snippets --------------------------------
  use 'hrsh7th/vim-vsnip'

  -- LSP -------------------------------------
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('plugins-config/nvim-compe')
    end
  }
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init()
    end
  }
  use 'kabouzeid/nvim-lspinstall'
  use 'ray-x/lsp_signature.nvim'
  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
  }

  -- GIT -------------------------------------
  use {
    'tpope/vim-fugitive',
    config = function()
      require('plugins-config/vim-fugitive')
    end
  } -- vimscript

  -- Others ----------------------------------
  use {
    'vimwiki/vimwiki',
    config = function()
      require('plugins-config/vim-wiki')
    end
  } -- vimscript
end)

