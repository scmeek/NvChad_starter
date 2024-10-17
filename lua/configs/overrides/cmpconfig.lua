return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local opts = require "nvchad.configs.cmp"

    opts.preselect = cmp.PreselectMode.None
    opts.completion.completeopt = "menu,menuone,noselect,noinsert"

    table.insert(opts.sources, { name = "crates" })
    table.insert(opts.sources, { name = "copilot" })

    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }

    local opts_with_nvchad = vim.tbl_deep_extend("force", opts, require "nvchad.cmp")
    return opts_with_nvchad
  end,
}
