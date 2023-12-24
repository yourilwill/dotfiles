local on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
--  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
--  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
  vim.keymap.set('n', 'sf', function()
    vim.lsp.buf.format { async = true }
  end)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)            -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,       --keyバインドなどの設定を登録
      capabilities = capabilities, --cmpを連携
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      },
    }
  end,
}
