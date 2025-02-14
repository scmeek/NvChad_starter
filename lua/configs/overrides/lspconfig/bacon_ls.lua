local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

return {
  autostart = true,
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "bacon-ls" },
  root_dir = require("lspconfig").util.root_pattern ".git",
  filetypes = { "rust" },
}
