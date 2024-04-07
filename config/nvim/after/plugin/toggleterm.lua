require("toggleterm").setup {
  start_in_insert = false,
}

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Return to normal mode"})
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { noremap = true, desc = "Toggle terminal horizontal"})
vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { noremap = true, desc = "Toggle all terminals"})
vim.keymap.set("n", "<leader>tf", ":TermSelect<CR>", { noremap = true, desc = "Find specific terminal"})
