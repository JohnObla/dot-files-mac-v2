-- https://github.com/nvim-telescope/telescope-fzf-native.nvim?tab=readme-ov-file#telescope-setup-and-configuration
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--ignore',
      '--no-ignore-vcs',
      '--glob=!node_modules/**',
      '--glob=!.git/**',
    },
  }
}
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
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { noremap = true, silent = true })

