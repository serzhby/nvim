return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          hidden = false
        }
      }
    }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "kotlin", "yaml", "http", "json", "graphql", "norg", "toml", "python" },
        sync_install = false,
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
  {
    'mbbill/undotree',
    lazy = false,
    config = function()
      vim.opt.undofile = true

      -- Build the path in a way that works on every OS
      local undodir = vim.fn.stdpath("state") .. "/undo"
      vim.opt.undodir = undodir .. "//"

      -- Auto-create the directory if it’s missing
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, "p")
      end
    end
  },
  { 'mfussenegger/nvim-dap' },
  { 'mfussenegger/nvim-jdtls' },
  { 'nvim-lua/plenary.nvim' },
  {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  {
    "rest-nvim/rest.nvim",
    lazy = true,
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
    "PedramNavid/dbtpal",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    ft = {
        "sql",
        "md",
        "yaml",
    },
    keys = {
        { "<leader>drf", "<cmd>DbtRun<cr>" },
        { "<leader>drp", "<cmd>DbtRunAll<cr>" },
        { "<leader>dtf", "<cmd>DbtTest<cr>" },
        { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
    },
    config = function()
        require("dbtpal").setup({
            path_to_dbt = "dbt",
            path_to_dbt_project = "",
            path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
            include_profiles_dir = true,
            include_project_dir = true,
            include_log_level = true,
            extended_path_search = true,
            protect_compiled_files = true,
            pre_cmd_args = {},
            post_cmd_args = {},
        })
        require("telescope").load_extension("dbtpal")
    end,
  },

  --{
  --  'akinsho/toggleterm.nvim',
  --  version = "*",
  --  config = function()
  --    require("toggleterm").setup {
  --      size = 20,
  --      open_mapping = [[<C-\>]],
  --      hide_numbers = true, -- hide the number column in toggleterm buffers
  --      shade_filetypes = {},
  --      shade_terminals = true,
  --      shading_factor = 2, -- the degree by which to darken to terminal colour, default: -30
  --      start_in_insert = true,
  --      insert_mappings = true, -- whether or not the open mapping applies in insert mode
  --      persist_size = true,
  --      direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
  --      close_on_exit = true, -- close the terminal window when the process exits
  --      shell = vim.o.shell, -- change the default shell
  --    }
  --  end,
  --  opts = {--[[ things you want to change go here]]}
  --}
  {
    -- find and replace plugin
    'nvim-pack/nvim-spectre'
  },
  {
    -- improved diagnostics plugin
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
