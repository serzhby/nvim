vim.g.is_devcontainer = vim.uv.fs_stat(vim.fn.stdpath("config") .. "/is_devcontainer") ~= nil
require("opts")
require("init-lazy")
require("keymaps")
require("commands")
require("formatters")
require("plugins").setup({
  "core",
  "look-and-feel",
  "git",
  "files",
  "code-assistant",
  "http"
})
