return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  tag = "stable",
  event = { "BufRead Cargo.toml" },
  config = function(_, opts)
    local crates = require "crates"

    opts.completion.cmp.enabled = true
    crates.setup(opts)

    require("cmp").setup.buffer {
      sources = {
        { name = "crates" },
      },
    }

    crates.show()
  end,
}
