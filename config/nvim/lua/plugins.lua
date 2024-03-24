-- plugins install
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  {"nvim-telescope/telescope-fzf-native.nvim",build = "make"},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"rose-pine/neovim", name = "rose-pine"}
}

