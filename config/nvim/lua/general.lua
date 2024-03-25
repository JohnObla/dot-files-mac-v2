-- helper function - https://oroques.dev/notes/neovim-init/
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end


local indent = 2
-- cmd 'colorscheme desert'                              -- Put your favorite colorscheme here
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'swapfile', false)                           -- Allow file to be modified by multiple neovim processes
-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 10 )                            -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
-- opt('o', 'clipboard', 'unnamedplus')                  -- Use system clipboard
opt('o', 'undofile', true)                            -- Save undo-trees in files
opt('o', 'undolevels', 10000)                         -- Number of undo saved
opt('o', 'undoreload', 10000)                         -- Number of undo saved
opt('o', 'hlsearch', true)                           -- Don't keep term highlighted after searching
opt('o', 'incsearch', true)                           -- Starts search before pressing return

opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap

-- highlight on yank
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

-- refresh buffer on focus
vim.cmd 'au WinEnter,TabEnter,FocusGained * checktime'
