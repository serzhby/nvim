return {
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  -- },
  {
    "xiantang/darcula-dark.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme("darcula-solid")
    end,
  },

  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme kanagawa]])
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
  --{
  --  'catppuccin/nvim',
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    -- load the colorscheme here
  --    vim.cmd([[colorscheme catppuccin]])
  --  end,
  --},

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "echasnovski/mini.icons",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = {
        enabled = true
      },
      select = {
        enabled = true
      },
      indent = {
        enabled = true
      },
      notifier = {
        enabled = true
      }
    }
  },

  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    opts = {
      -- your personnal icons can go here (to override)
      -- you can specify color or cterm_color instead of specifying both of them
      -- DevIcon will be appended to `name`
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      };
      -- globally enable different highlight colors per icon (default to true)
      -- if set to false all icons will have the default icon's color
      color_icons = true;
      -- globally enable default icons (default to false)
      -- will get overriden by `get_icons` option
      default = true;
      -- globally enable "strict" selection of icons - icon will be looked up in
      -- different tables, first by filename, and if not found by extension; this
      -- prevents cases when file doesn't have any extension but still gets some icon
      -- because its name happened to match some extension (default to false)
      strict = true;
      -- same as `override` but specifically for overrides by filename
      -- takes effect when `strict` is true
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
      };
      -- same as `override` but specifically for overrides by extension
      -- takes effect when `strict` is true
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        }
      };
    }
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {'kevinhwang91/promise-async'},
    config = function()
      vim.o.foldlevel = 999
      vim.o.foldlevelstart = 999
      vim.o.foldenable = true
      vim.o.foldcolumn = '1'
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:]]


      vim.lsp.config('*', {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      })

      require('ufo').setup()
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          {
            "rest",
            icon = "",
            fg = "#428890"
          },
          'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      local neoscroll = require('neoscroll')
      neoscroll.setup({
        hide_cursor = false,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        duration_multiplier = 0.6,   -- Global duration multiplier
        easing = 'linear',           -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = function(info)
          if info == "zz" then
            vim.schedule(function() vim.cmd("normal zz") end, 10)
          end
        end,
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        ignored_events = {           -- Events ignored while scrolling
          'WinScrolled', 'CursorMoved'
        },
      })
      local keymap = {
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 200; info = 'zz' }) end;
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 200; info = 'zz' }) end;
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 400 }) end;
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 400 }) end;
        ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
        ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
        ["zt"]    = function() neoscroll.zt({ half_win_duration = 200 }) end;
        ["zz"]    = function() neoscroll.zz({ half_win_duration = 200 }) end;
        ["zb"]    = function() neoscroll.zb({ half_win_duration = 200 }) end;
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  }

    -- {
      --   "rcarriga/nvim-notify",
      --   opts = {
        --     background_colour = "#000000",
        --   }
        -- },
        -- {
          --   "folke/noice.nvim",
          --   event = "VeryLazy",
          --   dependencies = {
            --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            --     "MunifTanjim/nui.nvim",
            --     -- OPTIONAL:
            --     --   `nvim-notify` is only needed, if you want to use the notification view.
            --     --   If not available, we use `mini` as the fallback
            --     "rcarriga/nvim-notify",
            --   },
            --   opts = {
              --     lsp = {
                --       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                --       override = {
                  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  --         ["vim.lsp.util.stylize_markdown"] = true,
                  --         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                  --       },
                  --     },
                  --     -- you can enable a preset for easier configuration
                  --     presets = {
                    --       bottom_search = true, -- use a classic bottom cmdline for search
                    --       command_palette = true, -- position the cmdline and popupmenu together
                    --       long_message_to_split = true, -- long messages will be sent to a split
                    --       inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    --       lsp_doc_border = false, -- add a border to hover docs and signature help
                    --     },
                    --   }
                    -- }
                  };
