local lazy = require("lazy")

local plugins = {
  -- {
  --   dir = "/home/sergey/code/ijhttp-nvim"
  -- },
  {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'telescope'.setup {
        pickers = {
          find_files = {
            hidden = false
          }
        }
      }
    end,
  },

  { 'ellisonleao/gruvbox.nvim' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup {}
    end
  },
  { 'tpope/vim-fugitive' },
  { 'idanarye/vim-merginal' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "kotlin", "yaml", "http", "json", "graphql", "norg", "toml", "python" },
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
  --{ 'theprimeagen/harpoon' },
  --{ 'mbbill/undotree' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  },

  -- { 'smartpde/telescope-recent-files' },
  { 'mfussenegger/nvim-dap' },
  { 'mfussenegger/nvim-jdtls' },
  { 'nvim-lua/plenary.nvim' },
  {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  --'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
  --{
  --  "tpope/vim-dadbod",
  --  dependencies = {
  --    "kristijanhusak/vim-dadbod-ui",
  --    "kristijanhusak/vim-dadbod-completion"
  --  },
  --},

  {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    -- dependencies = { "luarocks.nvim", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    version = "*",
    ft = "norg",
    -- config = true,
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.integrations.treesitter"] = {}
        }
      })
    end,
  },

  -- {
  --   'pwntester/octo.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end
  -- },

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
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function (_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    }
  },
  {
    "jemag/telescope-diff.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    }
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
      }
    }
  },
  {
    "github/copilot.vim"
  }

}


lazy.setup(plugins)
