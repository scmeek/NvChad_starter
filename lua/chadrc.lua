-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

-- Requires "minimal" theme as written
local ui_statusline_cursor_position_add_percent = function(minimum_cursor_position_string)
  local end_formatting = "%#St_sep_r#█ %#ST_EmptySpace#"
  local position_to_insert = minimum_cursor_position_string:len() - end_formatting:len()
  local current_line = vim.fn.line(".", vim.g.statusline_winid)
  local total_line = vim.fn.line("$", vim.g.statusline_winid)
  local percent = math.modf((current_line / total_line) * 100) .. tostring "%%"
  return minimum_cursor_position_string:sub(1, position_to_insert)
    .. " "
    .. percent
    .. minimum_cursor_position_string:sub(position_to_insert + 1)
end

M.base46 = {
  theme = "ashes",
  theme_toggle = { "ashes", "flexoki-light" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.lsp = { signature = false }

M.mason = {
  cmd = true,
  pkgs = {
    "arduino-language-server",
    "bacon",
    "bacon-ls",
    "bash-language-server",
    "clang-format",
    "clangd",
    "codelldb",
    "css-lsp",
    "eslint-lsp",
    --"glsl_analyzer",
    "html-lsp",
    "lua-language-server",
    "prettier",
    "pyright",
    "rust-analyzer",
    "shellcheck",
    "shfmt",
    "stylua",
    "taplo",
    "tailwindcss-language-server",
    "typescript-language-server",
    "yaml-language-server",
    "yamllint",
    "yamlfmt",
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.ui = {
  cmp = {
    format_colors = {
      tailwind = true,
    },
  },

  statusline = {
    theme = "minimal", -- including custom percent below relies on "minimal"
    separator_style = "block",
    overriden_modules = function(modules)
      -- cursor_position is last_in the table, depends on minimal theme
      modules[#modules] = ui_statusline_cursor_position_add_percent(modules[#modules])
    end,
  },
}

return M
