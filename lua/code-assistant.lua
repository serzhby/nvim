return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>ac", "<cmd>CodeCompanionChat<CR>",        desc = "CodeCompanion: chat" },
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "CodeCompanion: toggle chat" },
      { "<leader>aa", "<cmd>CodeCompanionActions<CR>",     desc = "CodeCompanion: actions" },
    },
    opts = {
      ignore_warnings = true,
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-sonnet-4",
                },
              },
            })
          end,
          litellm = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://litellm.idfaws.com",
                api_key = "LITELLM_API_KEY",
              },
              schema = {
                model = {
                  default = "chat-gpt-5-mini",
                },
              },
            })
          end,
        };
      };
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "litellm",
        },
        inline = {
          adapter = "litellm",
        },
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ", -- Prompt used for interactive LLM calls
          provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
      },
    }
  },
  -- {
  --   "github/copilot.vim"
  -- },

  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = vim.fn.has("win32") ~= 0
  --   and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --   or "make",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     -- this file can contain specific instructions for your project
  --     instructions_file = "CLAUDE.md",
  --     -- for example
  --     -- provider = "copilot",
  --     provider = "litellm",
  --     auto_suggestions_provider = "litellm",
  --     behaviour = {
  --       auto_suggestions = true,
  --     },
  --     acp_providers = {
  --       ["opencode"] = {
  --         command = "opencode",
  --         args = { "acp" }
  --       }
  --     },
  --     providers = {
  --       copilot = {
  --         model = "gpt-4.1",
  --       },
  --       litellm = {
  --         __inherited_from = "openai",
  --         endpoint = "https://litellm.idfaws.com",
  --         model = "chat-gpt-5-mini", -- also: gpt-5.4-mini, gpt-5.2, gpt-5.4-nano, chat-gpt-5.4, gpt-5-mini, chat-gpt-5.2
  --         api_key_name = "LITELLM_API_KEY",
  --         is_env_set = function() return os.getenv("LITELLM_API_KEY") ~= nil end,
  --       },
  --       -- ollama = {
  --       --   endpoint = "https://ai.serzh.by",
  --       --   model = "qwen-coder-7b-custom",
  --       --
  --       --   is_env_set = function() return true end,
  --       --   -- is_env_set = function() return require("avante.providers.ollama").check_endpoint_alive() end,
  --       --   extra_headers = {
  --       --     ["Authorization"] = "Basic " .. (os.getenv("OLLAMA_AUTH") or ""),
  --       --   },
  --       -- },
  --     },
  --     input = {
  --       provider = "snacks",
  --       provider_opts = {
  --         title = "Avante Input",
  --         placeholder = "Type your input here..."
  --       }
  --     },
  --     selector = {
  --       provider = "telescope",
  --       provider_opts = {}
  --     }
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     -- "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }

}
