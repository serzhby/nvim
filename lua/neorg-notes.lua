return {
  {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    -- dependencies = { "luarocks.nvim", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    dependencies = { "nvim-neorg/lua-utils.nvim", "pysan3/pathlib.nvim" },
    lazy = false,
    version = "*",
    ft = "norg",
    -- config = true,
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.integrations.treesitter"] = {}
      }
    }
  }
}
