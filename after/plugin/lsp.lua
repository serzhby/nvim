local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  --lsp.default_keymaps(opts)
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"lua_ls"},
  handlers = {
    function(server_name)
      if server_name == 'lua_ls' then
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim', 'use'}
              }
            }
          }
        })
      else
        require('lspconfig')[server_name].setup({})
      end
    end,
  },
})

lsp.setup()
