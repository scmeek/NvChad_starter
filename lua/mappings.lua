require "nvchad.mappings"

local constants = require "constants"

local map = vim.keymap.set

-- map("i", "jk", "<ESC>")

-- Movement across soft-wrapped lines
local mux_with_g = function(key)
  local gkey = "g" .. key
  return function()
    if vim.v.count == 0 then
      return gkey
    else
      return key
    end
  end
end
map({ "n", "v" }, "j", mux_with_g "j", { expr = true })
map({ "n", "v" }, "k", mux_with_g "k", { expr = true })

map("n", ":checkhealth", "<nop>", { desc = "Neovim Run health checks" })
map("n", ":checkhealth <plugin>", "<nop>", { desc = "Neovim Run health checks for a specific plugin" })

map("n", ";", ":", { desc = "General Enter command mode", nowait = true })
map("n", ".", "i", { desc = "General Repeat last command", noremap = true })
map("n", "<leader>-", "<C-W>s", { desc = "General Split horizontal" })
map("n", "<leader>\\", "<C-W>v", { desc = "General Split vertical" })
map("v", "<", "<gv", { desc = "General Decrease indent" })
map("v", ">", ">gv", { desc = "General Increase indent" })
map("v", ":!sort", "<nop>", { desc = "General Sort selected text" })
map("i", "<M-BS>", "<Esc>cvb", { desc = "General Backspace entire word" })

map("n", "}", "}", { desc = "Movement Move to next paragraph", noremap = false })
map("n", "{", "{", { desc = "Movement Move to previous paragraph", noremap = false })
map("n", "gt", ":bn<Cr>", { desc = "Movement Move to next buffer" })
map("n", "H", "^", { desc = "Movement Move to start of line" })
map("n", "%", "%", { desc = "Movement Move to matching brace" })
map("n", "L", "$", { desc = "Movement Move to end of line" })
map("n", "gT", ":bp<CR>", { desc = "Movement Move to previous buffer" })
map("v", "H", "^", { desc = "Movement Move to start of line" })
map("v", "L", "$", { desc = "Movement Move to end of line" })

map("n", "<leader>sf", "ggVG", { desc = "Text Select all in file" })
map("n", "gp", "`[v`]", { desc = "Text Re-select pasted text" })
map("n", "Y", "y$", { desc = "Text Yank rest of line" })
map("v", "Y", "Ygv<Esc>", { desc = "Text Yank" })
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "Text Swap line (below)" })
map("v", "y", "ygv<Esc>", { desc = "Text Yank" })
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "Text Swap line (above)" })

map("n", "` + {mark}", "<nop>", { desc = "Marks Move to mark" })
map("n", "m + {LETTER}", "<nop>", { desc = "Marks Set global mark" })
map("n", ":delm {marks}", "<nop>", { desc = "Marks Delete marks" })
map("n", "m + {letter}", "<nop>", { desc = "Marks Set local mark" })
map("n", "dm + {mark}", "<nop>", { desc = "Marks Delete mark" })
map("n", ":marks", "<nop>", { desc = "Marks List marks" })
map("n", "' + {mark}", "<nop>", { desc = "Marks Move to first character of mark line" })

map("n", "@ + {letter}", "<nop>", { desc = "Macros Run macro" })
map("n", "q + {letter}", "<nop>", { desc = "Macros Record macro" })

map("n", "za", "za", { desc = "Folds Toggle fold", noremap = false })
map("n", "zd", "zd", { desc = "Folds Delete fold", noremap = false })
map("n", "zr", "zr", { desc = "Folds Reduce (open) all folds by one level", noremap = false })
map("n", "zm", "zm", { desc = "Folds Fold more (close) all folds by one level", noremap = false })
map("n", "zi", "zi", { desc = "Folds Change fold method", noremap = false })

map("n", "c", "c", { desc = "NvimTree Copy file", noremap = true, silent = true })
map("n", "p", "p", { desc = "NvimTree Pase", noremap = true, silent = true })

map("n", "cs + {old char} + {new char}", "<nop>", { desc = "Surround Change surround character" })
map("n", "ds + {char}", "<nop>", { desc = "Surround Delete surround character" })
map("n", "ys + {motion} + {char}", "<nop>", { desc = "Surround Add surround character" })

map("n", "<leader>fr", function()
  require("telescope.builtin").resume()
end, { desc = "Telescope Resume find" })

map("n", "<leader>lf", function()
  vim.diagnostic.open_float {
    border = constants.default_border,
    severity_sort = true,
    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
      --vim.diagnostic.severity.INFO,
      --vim.diagnostic.severity.HINT,
    },
  }
end, { desc = "LSP Floating diagnostic" })
