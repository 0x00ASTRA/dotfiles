-- plugins.lua
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer manages itself

  -- Telescope for Fuzzy Finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }


  use 'echasnovski/mini.icons'

  -- Treesitter for Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }


  -- LSP Configurations
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- LSP Completion Source
  use 'L3MON4D3/LuaSnip' -- Snippets`

  -- Formatting and Linting
--  use 'jose-elias-alvarez/null-ls.nvim'
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  -- Git Integration
  use 'lewis6991/gitsigns.nvim'

  -- File Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Kerboscript Support
  use {
    'Freedzone/kerbovim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {'akinsho/toggleterm.nvim', tag = 'v2.*'}


  -- UI Improvements
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'xiyaowong/transparent.nvim'
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'folke/tokyonight.nvim' -- Theme
  use 'scottmckendry/cyberdream.nvim'
  use "nvim-lua/popup.nvim"
  use 'folke/which-key.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)

