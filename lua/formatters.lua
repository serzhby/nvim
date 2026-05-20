vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.equalprg = "jq ."
    vim.bo.formatexpr = "v:lua.vim.lsp.formatexpr()"
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
