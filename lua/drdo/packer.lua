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
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- Make telescope sorting go brr
    }
  }

  use 'neovim/nvim-lspconfig' -- LSP Configs
  use { -- Rust setup
    'simrat39/rust-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig'
    }
  }

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

  use { -- Magit clone
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Themes
  -- use 'folke/tokyonight.nvim'
  -- use 'nyoom-engineering/oxocarbon.nvim'
  use 'Mofiqul/vscode.nvim'

  use 'folke/which-key.nvim' -- Popup with help in pending mode

  use 'numToStr/Comment.nvim' -- Comment code

  use 'RRethy/vim-illuminate' -- Highlight word under cursor

  use 'wellle/targets.vim' -- More targets for around/inside etc

  use 'tpope/vim-surround' -- Change surroundings

  use("gbprod/yanky.nvim") -- Yank ring

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
