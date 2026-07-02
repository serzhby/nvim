return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      {
        "<leader>gl",
        function()
          local s = vim.fn.line("'<")
          local e = vim.fn.line("'>")
          vim.cmd(string.format("Gclog -L%d,%d:%%", s, e))
          vim.cmd("copen")
        end,
        mode = "x",
        desc = "Git history for selection (Fugitive)",
      },
      {
        "<leader>gd",
        function()
          if vim.wo.diff then
            vim.cmd('diffoff!')
            vim.cmd('only')
          else
            local ok, _ = pcall(vim.cmd, 'Gvdiffsplit')
            if not ok then
              vim.cmd('diffthis')
            end
          end
        end,
        desc = "Toggle Git diff view",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { "<leader>gpl", "<cmd>Octo pr list<CR>", desc = "Octo: list PRs" },
    },
    opts = {}
  },
  {
    'sindrets/diffview.nvim',
    lazy = false,
    keys = {
      { "<leader>dvo", "<cmd>DiffviewOpen<CR>",          desc = "Diffview: open" },
      { "<leader>dvm", "<cmd>DiffviewOpen origin/master...HEAD<CR>",          desc = "Diffview: open" },
      { "<leader>dvh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: file history" },
      { "<leader>dvc", "<cmd>DiffviewClose<CR>",         desc = "Diffview: close" },
    },
  }
}
