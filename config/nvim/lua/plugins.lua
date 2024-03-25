-- plugins install
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  {"nvim-telescope/telescope-fzf-native.nvim",build = "make"},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"rose-pine/neovim", name = "rose-pine"},
  -- lsp via lsp zero
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "jiangmiao/auto-pairs",
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
  "tpope/vim-commentary",
  "simeji/winresizer",
  "suy/vim-context-commentstring",
  "AndrewRadev/splitjoin.vim",
  "moll/vim-bbye",
  "tpope/vim-fugitive",
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
}

