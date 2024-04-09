-- plugins install
return {
  -- search text through neovim, including files, ripgreps, buffers, and help articles
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function ()
          require('telescope').load_extension('fzf')
        end
      },
    },
  },
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
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
  -- mason allows lsp config within neovim itself
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"VonHeikemen/lsp-zero.nvim"},
    config = function ()
      local lsp = require("lsp-zero")
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "clojure_lsp",
        },
        automatic_installation = true,
        handlers = {
          lsp.default_setup,
        },
      })
    end
  },
  -- lsp zero creates smart defaults for lsp config
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function ()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.setup()
      lsp.on_attach(function(client, bufnr)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to symbol definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Symbol description" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Prev diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Next diagnostic" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "Open diagnostics" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "Choose diagnostic fix" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename symbol" })
      end)

    end
  },
  -- lsp config allows type checking, errors, etc with any language
  -- the plugins below all do snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "VonHeikemen/lsp-zero.nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function ()
      local cmp = require("cmp")
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        })
      })
    end
  },
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
  {
    "simeji/winresizer",
    cmd = "WinResizerStartResize",
    keys = {
      { "<C-e>", desc = "Open WinResizer" }
    }
  },
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
    },
    init = function ()
      -- disable netrw at the very start of init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- enable 24-bit colour
      vim.opt.termguicolors = true
    end,
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
    opts = {
      sections = {
        lualine_c = { {'filename', path = 1} },
      },
      inactive_sections = {
        lualine_c = { {'filename', path = 1} },
      },
    }
  },
  -- clojure editing inside of neovim
  {
    "Olical/conjure",
    ft = { "clojure", "fennel" },
    -- [Optional] cmp-conjure for cmp
    dependencies = {
        {
          "PaterJason/cmp-conjure",
          config = function()
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, {
              name = "buffer",
              option = {
                sources = {
                  { name = "conjure" },
                },
              },
            })
            cmp.setup(config)
          end,
        },
    },
    config = function(_, opts)
        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()
    end,
  },
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
   {
    "folke/which-key.nvim",
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 800
    end,
    config = function ()
      local wk = require("which-key")
      wk.register({
        f = {
          name = "Telescope mappings",
          a = { name = "Search in repo of choice" },
          d = { name = "Search in dotfiles" },
        },
        t = {
          name = "Terminal mappings",
        },
        g = {
          name = "Git mappings"
        },
        h = {
          name = "Git Hunk mappings"
        },
      }, { prefix = "<leader>" })

      wk.register({
        ["["]= {
          name = "Previous Navigate"
        },
        ["]"]= {
          name = "Next Navigate"
        },
      })
    end
   },
  -- s-expression manipulation
  "guns/vim-sexp"
}



