---@type NvPluginSpec[]
local plugins = {
  require "configs.overrides.cmpconfig",
  require "configs.overrides.conformconfig",
  require "configs.overrides.gitsigns",
  require "configs.overrides.lspconfig",
  require "configs.overrides.nvimtree",
  require "configs.overrides.treesitter",

  require "configs.avante",
  require "configs.colorizer",
  require "configs.comments",
  require "configs.copilot",
  require "configs.copilotcmp",
  require "configs.crates",
  require "configs.dressing",
  require "configs.fugitive",
  require "configs.glslview",
  require "configs.lastplace",
  require "configs.multicursors",
  require "configs.noice",
  require "configs.nullls",
  require "configs.signature",
  require "configs.spider",
  require "configs.surround",
  require "configs.targets",
  require "configs.tmuxnavigator",
  require "configs.todocomments",
  require "configs.tsautotag",
}

return plugins
