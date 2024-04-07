vim.o.timeout = true
vim.o.timeoutlen = 800

local wk = require("which-key")
wk.register({
  f = {
    name = "Telescope mappings",
    a = { name = "Search in repo of choice" },
    d = { name = "Search in dotfiles" },
  },
  t = {
    name = "Terminal mappings",
  },
  g = {
    name = "Git mappings"
  }
}, { prefix = "<leader>" })

