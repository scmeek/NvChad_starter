return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  tag = "stable",
  event = { "BufRead Cargo.toml" },
  config = function(_, opts)
    opts.completion = {
      cmp = { enabled = true },
    }

    require("crates").setup(opts)

    require("cmp").setup.buffer {
      sources = {
        { name = "crates" },
      },
    }
  end,
}
