-- NOTE: use 'formatprg', not 'formatexpr'. rest.nvim formats response bodies by
-- running `gq` in a scratch buffer with no LSP client attached, so
-- vim.lsp.formatexpr() would silently do nothing there. Leaving 'formatexpr'
-- empty also keeps `gq` working in real json buffers: vim.lsp only installs its
-- formatexpr when both options are unset, so jq stays the json formatter.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.equalprg = "jq ."
    vim.bo.formatprg = "jq ."
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "xml",
  callback = function()
    vim.bo.equalprg = "xmllint --format -"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"html", "xhtml"},
  callback = function()
    vim.bo.formatexpr = "v:lua.vim.lsp.formatexpr()"
  end,
})
