return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup {}
    end
  },
  { 'tpope/vim-fugitive' },
  { 'idanarye/vim-merginal' },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
}
