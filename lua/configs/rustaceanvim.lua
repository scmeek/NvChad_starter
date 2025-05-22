local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local map = vim.keymap.set

local rust_analyzer_config_file = vim.fn.getcwd() .. "/.rust-analyzer.json"
local rust_analyzer_config_file_handler = io.open(rust_analyzer_config_file, "r")

return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = "rust",
  config = function()
    local extension_path = vim.fn.expand "$MASON/packages/codelldb/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"

    local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
    -- If you are on Linux, replace the line above with the line below:
    -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

    local cfg = require "rustaceanvim.config"

    local fetch_rust_analyzer_settings = function()
      if rust_analyzer_config_file_handler ~= nil then
        local config_json = rust_analyzer_config_file_handler:read "*a"
        rust_analyzer_config_file_handler:close()

        local config = vim.json.decode(config_json) or nil
        if config ~= nil then
          return config
        end
      end
      return {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          enable = false,
          command = "clippy",
        },
        diagnostics = {
          enable = false,
        },
      }
    end
    local rust_analyzer_settings = fetch_rust_analyzer_settings()

    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          -- DAP
          map("n", "<leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "debugger Testables" })
        end,
        capabilities = capabilities,
        root_dir = require("lspconfig/util").root_pattern "Cargo.toml",
        default_settings = {
          ["rust-analyzer"] = rust_analyzer_settings,
        },
      },
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
