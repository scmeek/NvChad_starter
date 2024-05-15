vim.loader.enable()
require "commands"
require "options"

-- Allow for undercurl diagnostics
local hl_groups = { "DiagnosticUnderlineError" }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. " gui=undercurl")
end

vim.diagnostic.config {
  signs = true,
  update_in_insert = true,
  severity_sort = true,
}
