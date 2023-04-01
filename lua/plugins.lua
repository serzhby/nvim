vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer сам себя
  use 'wbthomason/packer.nvim'


  use { 'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function() require'telescope'.setup {} end, }

  use { "ellisonleao/gruvbox.nvim" }
  use {'lewis6991/gitsigns.nvim'} 
  use { "tpope/vim-fugitive" }
  use { 'nvim-treesitter/nvim-treesitter' }
end)
