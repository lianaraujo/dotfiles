local lsp = require('lsp-zero').preset({})
local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.complete(),
  })
})

vim.diagnostic.config({
  virtual_text = false,

})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['null-ls'] = { 'javascript', 'typescript', 'php' },
  }
})

lsp.setup({
  diagnostics = {
    jump = { float = true }
  },
})
