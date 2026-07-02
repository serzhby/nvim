return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>f", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live grep" },
      { "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<leader>e", "<cmd>Telescope oldfiles<CR>",   desc = "Telescope oldfiles",   silent = true },
      { "<leader>b", "<cmd>Telescope buffers<CR>",    desc = "Telescope buffers" },
      { "<leader>h", "<cmd>Telescope help_tags<CR>",  desc = "Telescope help tags" },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
      }
    }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    branch = 'main',
    config = function()
      require('nvim-treesitter').setup()

      local parsers = {
        'c', 'lua', 'vim', 'vimdoc', 'query', 'java', 'kotlin',
        'yaml', 'http', 'json', 'graphql', 'toml',
        'python', 'bash', 'regex', 'markdown', 'sql',
      }
      require('nvim-treesitter').install(parsers)

      -- vimdoc parser handles the `help` filetype.
      local filetypes = {
        'c', 'lua', 'vim', 'help', 'query', 'java', 'kotlin',
        'yaml', 'http', 'json', 'graphql', 'toml',
        'python', 'bash', 'regex', 'markdown', 'sql',
      }
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    'mbbill/undotree',
    lazy = false,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
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
  {
    "jemag/telescope-diff.nvim",
    keys = {
      {
        "<leader>dc",
        function() require('telescope').extensions.diff.diff_current({ hidden = true }) end,
        desc = "Compare current file with another",
        silent = true,
      },
    },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    }
  },
  -- {
  --   "PedramNavid/dbtpal",
  --   lazy = true,
  --   dependencies = {
  --       "nvim-lua/plenary.nvim",
  --       "nvim-telescope/telescope.nvim",
  --   },
  --   ft = {
  --       "sql",
  --       "md",
  --       "yaml",
  --   },
  --   keys = {
  --       { "<leader>drf", "<cmd>DbtRun<cr>" },
  --       { "<leader>drp", "<cmd>DbtRunAll<cr>" },
  --       { "<leader>dtf", "<cmd>DbtTest<cr>" },
  --       { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
  --   },
  --   config = function()
  --       require("dbtpal").setup({
  --           path_to_dbt = "dbt",
  --           path_to_dbt_project = "",
  --           path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
  --           include_profiles_dir = true,
  --           include_project_dir = true,
  --           include_log_level = true,
  --           extended_path_search = true,
  --           protect_compiled_files = true,
  --           pre_cmd_args = {},
  --           post_cmd_args = {},
  --       })
  --       require("telescope").load_extension("dbtpal")
  --   end,
  -- },
  --
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
    'nvim-pack/nvim-spectre',
    keys = {
      { "<leader>S",  '<cmd>lua require("spectre").toggle()<CR>',                            desc = "Toggle Spectre" },
      { "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',     desc = "Search current word" },
      { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>',                  mode = "v", desc = "Search current word" },
      { "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },
    },
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
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', branch = 'main' },
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      completions = {
        lsp = {
          enabled = true
        }
      }
    },
    ft = { 'markdown', 'md', 'codecompanion', 'Avante' },
  },

  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.snippets').setup()
      require('mini.completion').setup()
      require('mini.pairs').setup()
    end
  },

  {
    'mfussenegger/nvim-dap'
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
  }
}
