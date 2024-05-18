-- vim.cmd - execute Vim commands vim.api.nvim_exec - execute Vimscript
-- vim.g - global variables
-- vim.opt - global/buffer/windows-scoped options
vim.g.mapleader = ' '
vim.cmd([[
syntax enable
]])
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = 'unnamedplus'

require("gitsigns").setup()
require("keymaps")
require("plugins")
require("telescope").load_extension("recent_files")
require("telescope").load_extension("file_browser")
require("nvim-tree").setup()
--require("nvim-http")
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- set transparent background
vim.api.nvim_set_hl(0, "Normal", { bg ="none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg ="none" })

vim.cmd([[
  command Gpush Git pull --rebase | Git push
  command Jq %!jq .
  command Gw w | Gwrite
  command Gwc w | Gwrite | Git commit
  command Gconfig w | Gwrite | Git commit -m "feat(mx): config." | Git pull --rebase | Git push
]])

-- local function get_buffer_by_name(name)
--     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--         local buf_name = vim.api.nvim_buf_get_name(buf)
--         if string.find(buf_name, name) then
--             return buf
--         end
--     end
--     return nil
-- end
-- 
-- vim.api.nvim_create_user_command(
--   "Ij", 
--   function(opts)
--     local original_buffer = vim.api.nvim_get_current_buf()
--     vim.api.nvim_command("write")
--     local file_name = vim.api.nvim_buf_get_name(original_buffer)
--           -- local bufname = "ijbuffer"
--           -- bufnr = get_buffer_by_name(bufname)
--           -- if bufnr == nil then
--           --   vim.api.nvim_command(string.format("botright vsplit %s", bufname))
--           --   bufnr = vim.api.nvim_get_current_buf()
--           --   vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
--           --   vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
--           --   vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
--           -- end
-- 
--     -- -- vim.api.nvim_buf_set_name(bufnr, bufname)
--     vim.fn.jobstart({"/home/sergey/dev/scripts/./ij.sh", "mx", "local", file_name}, {
--       stdout_buffered = true,
--       on_stdout = function(_, data)
--         if data then
--           local bufname = data[1]
--           bufnr = get_buffer_by_name(bufname)
--           if bufnr == nil then
--             vim.api.nvim_command(string.format("botright vsplit %s", bufname))
--             -- bufnr = vim.api.nvim_get_current_buf()
--             -- vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
--             -- vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
--             -- vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
--           end
--           -- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
--         end
--       end,
--       on_stderr = function(_, data)
--         if data and data[1] ~= "" then
--           local bufname = "ijbuffer"
--           bufnr = get_buffer_by_name(bufname)
--           if bufnr == nil then
--             vim.api.nvim_command(string.format("botright vsplit %s", bufname))
--             bufnr = vim.api.nvim_get_current_buf()
--             vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
--             vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
--             vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
--           end
--           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
--         end
--       end,
--     })
--   end,
--   { 
--     nargs = 0,
--     -- complete = function(ArgLead, CmdLine, CursorPos)
--     --   -- return completion candidates as a list-like table
--     --   return { "foo", "bar", "baz" }
--     -- end,
--   }
-- )
--


