vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
wk.register({
  f = {
    name = "Telescope find",
    a = { name = "Search in repo of choice" },
    d = { name = "Search in dotfiles" },
  },
  t = {
    name = "Terminal mappings",
  },
}, { prefix = "<leader>" })

