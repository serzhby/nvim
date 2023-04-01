local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
g.mapleader = ';'
cmd([[
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.hlsearch = true
opt.relativenumber = true
opt.number = true

opt.clipboard = 'unnamedplus'

require('gitsigns').setup()
require("keymaps")
require("plugins")
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
