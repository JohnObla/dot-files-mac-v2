local lsp = require("lsp-zero")
lsp.preset("recommended")

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

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to symbol definition" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Symbol description" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Prev diagnostic" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Next diagnostic" })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "Open diagnostics" })
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "Choose diagnostic fix" })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename symbol" })

  -- commenting as listing all symbols in workspace is rarely used
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "" })

  -- commenting as it's already covered by <leader>fe (searches references)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "" })

  -- commenting as signature help doesn't seem useful while hover exists
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false, desc = "" })
end)

lsp.setup()

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
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

