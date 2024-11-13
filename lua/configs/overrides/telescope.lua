return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local opts = require "nvchad.configs.telescope"
    opts.defaults.layout_strategy = "vertical"
    return opts
  end,
}
