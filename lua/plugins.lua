vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }


  use { 'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function() require'telescope'.setup {} end, }

  use { 'ellisonleao/gruvbox.nvim' }
  use { 'lewis6991/gitsigns.nvim' } 
  use { 'tpope/vim-fugitive' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'theprimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use {
   'VonHeikemen/lsp-zero.nvim',
   branch = 'v1.x',
   requires = {
     -- LSP Support
     { 'neovim/nvim-lspconfig' },
     { 'williamboman/mason.nvim' },
     { 'williamboman/mason-lspconfig.nvim' },

     -- Autocompletion
     { 'hrsh7th/nvim-cmp' },
     { 'hrsh7th/cmp-buffer' },
     { 'hrsh7th/cmp-path' },
     { 'saadparwaiz1/cmp_luasnip' },
     { 'hrsh7th/cmp-nvim-lsp' },
     { 'hrsh7th/cmp-nvim-lua' },

     -- Snippets
     { 'L3MON4D3/LuaSnip' },
     { 'rafamadriz/friendly-snippets' },
   }
  }
  use { 'smartpde/telescope-recent-files' }
  use { 'mfussenegger/nvim-dap' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'nvim-lua/plenary.nvim' }
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
