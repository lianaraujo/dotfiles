local lsp = require('lsp-zero').preset({})
vim.diagnostic.config({
  virtual_text = false
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
    ['null-ls'] = { 'javascript', 'typescript' },
  }
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'jedi_language_server',
  'bashls',
  'lua_ls',
  'rust_analyzer'
})
lsp.setup()
