-- https://github.com/nvim-telescope/telescope-fzf-native.nvim?tab=readme-ov-file#telescope-setup-and-configuration
require('telescope').setup {}
require('telescope').load_extension('fzf')

-- https://www.youtube.com/watch?v=w7i4amO_zaE
local builtin = require('telescope.builtin')
local find_command = {
  'rg',
  '--files',
  '--ignore',
  '--hidden',
  '--no-ignore-vcs',
  '-g',
  '!node_modules/**',
  '-g',
  '!.git/**',
}
vim.keymap.set('n', '<leader>ff', function () builtin.find_files({find_command = find_command}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', require('telescope.builtin').lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fdf', function () builtin.find_files({find_command = find_command, cwd = '~/.dotfiles'}) end, {})
vim.keymap.set('n', '<leader>fdr', function()
  builtin.grep_string({ search = vim.fn.input("Grep > "), cwd =  '~/.dotfiles'});
end)
