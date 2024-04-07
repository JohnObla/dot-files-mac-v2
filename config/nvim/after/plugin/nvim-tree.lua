-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bcgvbanyyl ranoyr 24-ovg pbybhe
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  git = {
    ignore = false,
  }
})

-- map toggling tree
vim.keymap.set("n", "<leader>e", ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = "Toggle file explorer" })
