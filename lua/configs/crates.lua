local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  tag = "stable",
  event = { "BufRead Cargo.toml" },
  config = function(_, opts)
    opts.lsp = {
      enabled = true,
      on_attach = on_attach,
      actions = true,
      completion = true,
      hover = true,
    }

    require("crates").setup(opts)
  end,
}
