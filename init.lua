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

require("plugins")
require("keymaps")
require("ijhttp-nvim").setup({
  ijhttp_path = "/home/sergey/dev/ijhttp/ijhttp"
})
require("gitsigns").setup()
require("telescope").load_extension("recent_files")
require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("rest")
require("telescope").setup {
  pickers = {
    find_files = {
      hidden = false
    }
  }
}
require("nvim-tree").setup()
--require("nvim-http")
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- set transparent background
vim.api.nvim_set_hl(0, "Normal", { bg ="none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg ="none" })

vim.g.db_ui_save_location = "/home/sergey/.config/nvim/db_ui"

vim.cmd([[
  command Gpush Git pull --rebase | Git push
  command Jq %!jq .
  command Gw w | Gwrite
  command Gwc w | Gwrite | Git commit
  command Gconfig w | Gwrite | Git commit -m "feat(mx): config." | Git pull --rebase | Git push
]])

