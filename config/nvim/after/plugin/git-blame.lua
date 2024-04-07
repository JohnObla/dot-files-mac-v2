require('gitblame').setup {
  -- disable by default
  enabled = false,
  -- no delay when displaying text
  delay = 0,
}
--
-- enable with toggle
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")

