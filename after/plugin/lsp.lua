local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<C-M-b>", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], opts)
  -- vim.keymap.set("n", "<C-M-b>", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<C-M-i>", [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)
  -- vim.keymap.set("n", "<C-M-i>", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], opts)
  --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>fu", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
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

-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {"lua_ls", "groovyls", "html", "pyright", "bashls"},
--   handlers = {
--     function(server_name)
--       if server_name == 'lua_ls' then
--         require('lspconfig').lua_ls.setup({
--           cmd = { "lua-language-server" };
--           settings = {
--             Lua = {
--               diagnostics = {
--                 globals = {'vim', 'use'}
--               }
--             }
--           }
--         })
--       elseif server_name == 'groovyls' then
--         require('lspconfig').groovyls.setup({
--           cmd = { "/home/sergey/dev/jdk17/bin/java", "-jar", "/home/sergey/dev/groovy-language-server-all.jar" },
--         })
--       elseif server_name == 'pyright' then
--         require('lspconfig').pyright.setup({})
--       elseif server_name == 'bashls' then
--         require('lspconfig').bashls.setup({})
--       elseif server_name == 'html' then
--         local capabilities = vim.lsp.protocol.make_client_capabilities()
--         capabilities.textDocument.completion.completionItem.snippetSupport = true
--         require('lspconfig').html.setup({
--           cmd = { "vscode-html-language-server", "--stdio" },
--           filetypes = { "html", "templ" },
--           capabilities = capabilities
--         })
--       else
--         require('lspconfig')[server_name].setup({})
--       end
--     end,
--   },
-- })
require('lspconfig').nixd.setup({})

require('lspconfig').lua_ls.setup({
  cmd = { "lua-language-server" };
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim', 'use'}
      }
    }
  }
})


require('lspconfig').groovyls.setup({
  cmd = { "/home/sergey/dev/jdk17/bin/java", "-jar", "/home/sergey/dev/groovy-language-server-all.jar" },
})
require('lspconfig').pyright.setup({})
require('lspconfig').bashls.setup({})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').html.setup({
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  capabilities = capabilities
})
--require('lspconfig')[server_name].setup({})

lsp.setup()
