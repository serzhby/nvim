vim.lsp.enable("nixd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("groovyls")
vim.lsp.enable("pyright")
vim.lsp.enable('bashls')
vim.lsp.enable("html")
vim.lsp.enable("tinymist")
vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable vim.lsp.completion',
  callback = function(event)
    local client_id = vim.tbl_get(event, 'data', 'client_id')
    if client_id == nil then
      return
    end

    vim.lsp.completion.enable(true, client_id, event.buf, {autotrigger = false})

    -- Trigger lsp completion manually using Ctrl + Space
    vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.completion.get()<cr>')
  end
})
