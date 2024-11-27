local lspconfigs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local default_config_servers = {
  "bashls",
  "clangd",
  "cssls",
  --"glsl_analyzer",
  "html",
  "pyright",
  "taplo",
  "tailwindcss",
  "vimls",
  "yamlls",
}

local custom_config_servers = {
  arduino_language_server = require "configs.overrides.lspconfig.arduino_language_server",
  eslint = require "configs.overrides.lspconfig.eslint",
  ts_ls = require "configs.overrides.lspconfig.ts_ls",
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    require "nvchad.configs.lspconfig"

    for _, lsp in ipairs(default_config_servers) do
      lspconfig[lsp].setup {
        on_init = lspconfigs.on_init,
        on_attach = lspconfigs.on_attach,
        capabilities = lspconfigs.capabilities,
      }
    end

    for server_name, server_custom_config in pairs(custom_config_servers) do
      lspconfig[server_name].setup(server_custom_config)
    end
  end,
}
