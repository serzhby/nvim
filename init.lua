-- vim.cmd - execute Vim commands vim.api.nvim_exec - execute Vimscript
-- vim.g - global variables
-- vim.opt - global/buffer/windows-scoped options
vim.g.mapleader = ' '
-- vim.cmd([[syntax enable]])
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = 'unnamedplus'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")

require("keymaps")
-- require("ijhttp-nvim").setup({
--   ijhttp_path = "ijhttp",
--   project_config_file_name = ".ijhttp.project",
--   root_dir_name = ".ijhttp",
--   env_file_name = "http-client.env.json",
--   env_warn = {"prod"}
-- })

vim.g.rest_nvim = {
  ui = {
    winbar = true
  }
}
require("telescope").load_extension("rest")

require("telescope").load_extension("file_browser")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- set transparent background
vim.api.nvim_set_hl(0, "Normal", { bg ="none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg ="none" })

-- vim.g.db_ui_save_location = "/home/sergey/.config/nvim/db_ui"

vim.cmd([[
  command Gpush Git pull --rebase | Git push
  command Jq %!jq .
  command Gwc w | Gwrite | Git commit
  command Gconfig w | Gwrite | Git commit -m "feat(mx): config." | Git pull --rebase | Git push
]])

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.formatprg = "jq ."
  end,
})
