return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      lsp_doc_border = true, -- add a border to hover docs and signature help
      long_message_to_split = true, -- long messages will be sent to a split
    },
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
    routes = {
      -- Show @recording messages
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      -- Hide `written` messages
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      -- Hide search virtual text
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
    },
    views = {
      -- Clean cmdline_popup
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- optional for notification view
    {
      "rcarriga/nvim-notify",
      opts = { background_colour = "#000000" }, -- Suppress warning for transparency
    },
  },
}
