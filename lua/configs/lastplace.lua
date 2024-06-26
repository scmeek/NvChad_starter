return {
  "ethanholz/nvim-lastplace",
  event = "VeryLazy",
  opts = {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
    lastplace_open_folds = true,
  },
}
