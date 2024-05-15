local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local default_config_servers = {
  "bashls",
  "clangd",
  "cssls",
  "glsl_analyzer",
  "html",
  "pyright",
  "rust_analyzer",
  "taplo",
  "tailwindcss",
  "vimls",
  "yamlls",
}

local custom_config_servers = {
  arduino_language_server = require "configs.overrides.lspconfig.arduino_language_server",
  eslint = require "configs.overrides.lspconfig.eslint",
  rust_analyzer = require "configs.overrides.lspconfig.rust_analyzer",
  tsserver = require "configs.overrides.lspconfig.tsserver",
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    require "nvchad.configs.lspconfig"

    for _, lsp in ipairs(default_config_servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

    for server_name, server_custom_config in pairs(custom_config_servers) do
      lspconfig[server_name].setup(server_custom_config)
    end
  end,
}
