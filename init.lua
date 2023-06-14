-- vim.cmd - execute Vim commands
-- vim.api.nvim_exec - execute Vimscript
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

vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = 'unnamedplus'

require('gitsigns').setup()
require("keymaps")
require("plugins")
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
]])
