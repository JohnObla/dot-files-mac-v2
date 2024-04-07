-- plugins install
return {
  -- search text through neovim, including files, ripgreps, buffers, and help articles
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = true
  },
  -- better fuzzy finder for telescope
  {"nvim-telescope/telescope-fzf-native.nvim",build = "make"},
  -- rich syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = true,
    opts = {
      -- A list of parser names, or "all" (the listed parsers below should always be installed)
      ensure_installed = { "javascript", "typescript", "clojure", "c", "lua", "vim", "vimdoc", "query" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
      },
    }
  },
  -- colour scheme that's regularly updated with neovim
  {
    "rebelot/kanagawa.nvim",
    config = true,
    opts = {
      theme = "wave"
    }
  },
  -- mason allows lsp config within neovim itself
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- lsp zero creates smart defaults for lsp config
  {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  -- lsp config allows type checking, errors, etc with any language
  "neovim/nvim-lspconfig",
  -- the plugins below all do snippets
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
      { "\"",    mode = { "n", "v" }, desc = "Open register menu" },
      { "<C-R>", mode = "i", desc = "Open register menu" }
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
  {
    "moll/vim-bbye",
    keys = {
      { "<leader>q", ":Bdelete<CR>", desc = "Delete buffer but keep window" },
      { "<leader>w", ":w<CR>", desc = "Save changes to buffer" },
      { "<leader>Q", ":q<CR>", desc = "Close window but keep buffer" },
    }
  },
  -- using git inside of neovim
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
  },
  -- file explorer inside neovim
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    keys = {
      {
        "<leader>e",
        ":NvimTreeFindFileToggle<CR>",
        desc = "Toggle File Explorer",
        noremap = true,
        silent = true,
      }
    },
    opts = {
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
    }
  },
  -- terminal inside neovim
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
      { "<C-Space>", [[<C-\><C-n>]], noremap = true, desc = "Return to normal mode", mode = "t" },
      { "<leader>tt", ":ToggleTerm<CR>", noremap = true, desc = "Toggle terminal horizontal" },
      { "<leader>ta", ":ToggleTermToggleAll<CR>", noremap = true, desc = "Toggle all terminals" },
      { "<leader>tf", ":TermSelect<CR>", noremap = true, desc = "Find specific terminal" },
    }
  },
  -- status line at bottom of window
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  -- clojure editing inside of neovim
  "Olical/conjure",
  -- show git blame commits
  {
    "f-person/git-blame.nvim",
    config = true,
    opts = {
      -- disable by default
      enabled = false,
      -- no delay when displaying text
      delay = 0,
    },
    keys = {
      { "<leader>gb", ":GitBlameToggle<CR>", desc = "Toggle Git Blame" }
    }
  },  -- easier way to navigate inside files
  "easymotion/vim-easymotion",
  -- show diff changes using colored bars
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  -- show all shortcuts
  "folke/which-key.nvim",
}

