return {
  {
    "rest-nvim/rest.nvim",
    lazy = true,
    keys = {
      {
        "<leader>re",
        function() require('telescope').extensions.rest.select_env() end,
        desc = "Select rest.nvim environment",
        silent = true,
      },
      { "<leader>rc", "<cmd>Rest cookies<CR>", desc = "Rest cookies", silent = true },
    },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", branch = "main"},
      "j-hui/fidget.nvim",
      "nvim-neotest/nvim-nio",
      opts = function (_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
    config = function()
      vim.g.rest_nvim = {
        ui = {
          winbar = true
        }
      }
      require("telescope").load_extension("rest")
    end,
  },
}
