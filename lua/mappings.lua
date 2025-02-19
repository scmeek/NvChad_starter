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

map("n", ":checkhealth", "<nop>", { desc = "neovim Run health checks" })
map("n", ":checkhealth <plugin>", "<nop>", { desc = "neovim Run health checks for a specific plugin" })

map("n", ";", ":", { desc = "general Enter command mode", nowait = true })
map("n", ".", "i", { desc = "general Repeat last command", noremap = true })
map("n", "<leader>-", "<C-W>s", { desc = "general Split horizontal" })
map("n", "<leader>\\", "<C-W>v", { desc = "general Split vertical" })
map("v", "<", "<gv", { desc = "general Decrease indent" })
map("v", ">", ">gv", { desc = "general Increase indent" })
map("v", ":!sort", "<nop>", { desc = "general Sort selected text" })
map("i", "<M-BS>", "<Esc>cvb", { desc = "general Backspace entire word" })

map("n", "}", "}", { desc = "movement Move to next paragraph", noremap = false })
map("n", "{", "{", { desc = "movement Move to previous paragraph", noremap = false })
map("n", "gt", ":bn<Cr>", { desc = "movement Move to next buffer" })
map("n", "H", "^", { desc = "movement Move to start of line" })
map("n", "%", "%", { desc = "movement Move to matching brace" })
map("n", "L", "$", { desc = "movement Move to end of line" })
map("n", "gT", ":bp<CR>", { desc = "movement Move to previous buffer" })
map("v", "H", "^", { desc = "movement Move to start of line" })
map("v", "L", "$", { desc = "movement Move to end of line" })

map("n", "<leader>sf", "ggVG", { desc = "text Select all in file" })
map("n", "gp", "`[v`]", { desc = "text Re-select pasted text" })
map("n", "Y", "y$", { desc = "text Yank rest of line" })
map("v", "Y", "Ygv<Esc>", { desc = "text Yank" })
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "text Swap line (below)" })
map("v", "y", "ygv<Esc>", { desc = "text Yank" })
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "text Swap line (above)" })

map("n", "` + {mark}", "<nop>", { desc = "marks Move to mark" })
map("n", "m + {LETTER}", "<nop>", { desc = "marks Set global mark" })
map("n", ":delm {marks}", "<nop>", { desc = "marks Delete marks" })
map("n", "m + {letter}", "<nop>", { desc = "marks Set local mark" })
map("n", "dm + {mark}", "<nop>", { desc = "marks Delete mark" })
map("n", ":marks", "<nop>", { desc = "marks List marks" })
map("n", "' + {mark}", "<nop>", { desc = "marks Move to first character of mark line" })

map("n", "@ + {letter}", "<nop>", { desc = "macros Run macro" })
map("n", "q + {letter}", "<nop>", { desc = "macros Record macro" })

map("n", "za", "za", { desc = "folds Toggle fold", noremap = false })
map("n", "zd", "zd", { desc = "folds Delete fold", noremap = false })
map("n", "zr", "zr", { desc = "folds Reduce (open) all folds by one level", noremap = false })
map("n", "zm", "zm", { desc = "folds Fold more (close) all folds by one level", noremap = false })
map("n", "zi", "zi", { desc = "folds Change fold method", noremap = false })

map("n", "c", "c", { desc = "nvimtree Copy file", noremap = true, silent = true })
map("n", "p", "p", { desc = "nvimtree Paste", noremap = true, silent = true })

map("n", "cs + {old char} + {new char}", "<nop>", { desc = "surround Change surround character" })
map("n", "ds + {char}", "<nop>", { desc = "surround Delete surround character" })
map("n", "ys + {motion} + {char}", "<nop>", { desc = "surround Add surround character" })

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
