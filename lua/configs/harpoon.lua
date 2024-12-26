return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "VeryLazy",
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {}

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set("n", "<C-a>", function()
      harpoon:list():add()
    end, { desc = "harpoon Add to list" })

    vim.keymap.set("n", "<C-m>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "harpoon Open window" })

    vim.keymap.set("n", "<C-u>", function()
      harpoon:list():select(1)
    end, { desc = "harpoon Go to first" })

    vim.keymap.set("n", "<C-i>", function()
      harpoon:list():select(2)
    end, { desc = "harpoon Go to second" })

    vim.keymap.set("n", "<C-o>", function()
      harpoon:list():select(3)
    end, { desc = "harpoon Go to third" })

    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():select(4)
    end, { desc = "harpoon Go to fourth" })

    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "harpoon Go to previous" })

    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "harpoon Go to next" })
  end,
  priority = 490,
}
