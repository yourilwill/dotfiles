local dracula = require("dracula")
dracula.setup({
  show_end_of_buffer = true,
  transparent_bg = true,
  colors = {
    nontext = "#6272A4",
  },
})
vim.cmd([[colorscheme dracula]])
