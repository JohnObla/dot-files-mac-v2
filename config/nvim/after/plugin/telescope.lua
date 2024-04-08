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

local cwdFn = function ()
 return "~/repos/" .. vim.fn.input("repo > ")
end

vim.keymap.set('n', '<leader>ff', function () builtin.find_files({find_command = find_command}) end, { desc = "Search all files in directory" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Search all git files in directory" })
vim.keymap.set('n', '<leader>fr', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ")});
end, { desc = "Search inside directory for pattern" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search through buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search all help files" })
vim.keymap.set('n', '<leader>fe', builtin.lsp_references, { noremap = true, silent = true, desc = "Search symbol references" })
vim.keymap.set('n', '<leader>fdf', function () builtin.find_files({find_command = find_command, cwd = '~/.dotfiles'}) end, { desc = "Search all files in dotfiles repo" })
vim.keymap.set('n', '<leader>fdr', function()
  builtin.grep_string({ search = vim.fn.input("Grep > "), cwd =  '~/.dotfiles'});
end, { desc = "Search for pattern in dotfiles repo" })
vim.keymap.set('n', '<leader>fag', function()
  builtin.git_files({ cwd = cwdFn()});
end, { desc = "Search all files in repo of choice" })
vim.keymap.set('n', '<leader>far', function()
  builtin.grep_string({ cwd = cwdFn(), search = vim.fn.input("Grep > ")});
end, { desc = "Search for pattern in repo of choice" })
vim.keymap.set('n', '<leader>fc', builtin.git_status, { desc = "Search through git changes" })
