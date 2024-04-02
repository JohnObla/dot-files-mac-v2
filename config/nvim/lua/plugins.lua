-- plugins install
return {
  -- search text through neovim, including files, ripgreps, buffers, and help articles
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  -- better fuzzy finder for telescope
  {"nvim-telescope/telescope-fzf-native.nvim",build = "make"},
  -- rich syntax highlighting
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  -- colour scheme that's regularly updated with neovim
  "rebelot/kanagawa.nvim",
  -- mason allows lsp config within neovim itself
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- lsp zero creates smart defaults for lsp config
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  -- lsp config allows type checking, errors, etc with any language
  "neovim/nvim-lspconfig",
  -- the 3 plugins below all do snippets
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  -- manipulates brackets, speech marks, etc using neovim
  "tpope/vim-surround",
  -- allows the dot operator to work with plugins
  "tpope/vim-repeat",
  -- automatically adds closing brackets, speech marks, etc.
  "jiangmiao/auto-pairs",
  -- ui for working with copy and paste registers
  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    config = true,
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    name = "registers",
  },
  -- comments in any language
  "tpope/vim-commentary",
  -- allows comments in nested languages
  "suy/vim-context-commentstring",
  -- ui for resizing windows in neovim
  "simeji/winresizer",
  -- converting single line statement to multi-line and vice versa
  "AndrewRadev/splitjoin.vim",
  -- better management of closing buffers and windows
  "moll/vim-bbye",
  -- using git inside of neovim
  "tpope/vim-fugitive",
  -- file explorer inside neovim
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  -- terminal inside neovim
  {"rebelot/terminal.nvim", name = "terminal"},
  -- status line at bottom of window
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
}

