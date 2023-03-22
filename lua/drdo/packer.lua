local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
 
  use 'tpope/vim-sleuth' -- Heuristic indent size
  use 'tpope/vim-abolish' -- Smart case susbstitution, snake/camel/etc coercion

  use { -- Fuzzy finder over lists
    'nvim-lua/telescope.nvim',
    requires = {
      use 'nvim-lua/plenary.nvim',
      use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- Make telescope sorting go brr
    }
  }

  use { -- File browser
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use 'neovim/nvim-lspconfig' -- LSP Configs

  use 'hrsh7th/nvim-cmp' -- Completion framework
  -- nvim-cmp completion sources
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip' 

  use 'nvim-treesitter/nvim-treesitter' -- Tree sitter

  use { -- Fancy status line
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { -- Magit clone
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  use 'yeddaif/neovim-purple' -- Purple theme

  use { -- Popup with help in pending mode
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'numToStr/Comment.nvim' -- Toggle comments

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
