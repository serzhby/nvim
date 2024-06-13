vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init({
  luarocks = {
    python_cmd = 'python3'
  }
})

return packer.startup(function()
  use { 'wbthomason/packer.nvim' }

  use { 'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function() require'telescope'.setup {} end, }

  use { 'ellisonleao/gruvbox.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'idanarye/vim-merginal' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'theprimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  --use {
  -- 'VonHeikemen/lsp-zero.nvim',
  -- branch = 'v1.x',
  -- requires = {
  --   -- LSP Support
  --   { 'neovim/nvim-lspconfig' },
  --   { 'williamboman/mason.nvim' },
  --   { 'williamboman/mason-lspconfig.nvim' },

  --   -- Autocompletion
  --   { 'hrsh7th/nvim-cmp' },
  --   { 'hrsh7th/cmp-buffer' },
  --   { 'hrsh7th/cmp-path' },
  --   { 'saadparwaiz1/cmp_luasnip' },
  --   { 'hrsh7th/cmp-nvim-lsp' },
  --   { 'hrsh7th/cmp-nvim-lua' },

  --   -- Snippets
  --   { 'L3MON4D3/LuaSnip' },
  --   { 'rafamadriz/friendly-snippets' },
  -- }
  --}
  use { 'smartpde/telescope-recent-files' }
  use { 'mfussenegger/nvim-dap' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'nvim-lua/plenary.nvim' }
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  -- use { 'BlackLight/nvim-http' }
  -- use {
  --   "rest-nvim/rest.nvim",
  --   rocks = { {"lua-curl", env = { CURL_INCDIR="/usr/include/x86_64-linux-gnu" } }, "nvim-nio", "mimetypes", "xml2lua" },
  -- }

  use {
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion"
    },
  }

  use {
    "nvim-neorg/neorg",
    rocks = { "lua-utils.nvim", "lua-utils", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
    tag = "v8.7.1", -- Pin Neorg to the latest stable release
    ft = "norg",
    cmd = "Neorg",
    config = function()
      print('Setup called')
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {}
        }
      })
    end
  }
end)
