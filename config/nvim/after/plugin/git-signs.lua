require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end,
    { desc = "Next Hunk" })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end,
    { desc = "Previous Hunk" })

    -- Hunk Specific
    map('n', '<leader>hs', gitsigns.stage_hunk, {desc = "Stage Hunk"})
    map('n', '<leader>hr', gitsigns.reset_hunk, {desc = "Reset Hunk"})
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Stage Hunk"})
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Reset Hunk"})
    map('n', '<leader>hS', gitsigns.stage_buffer, {desc = "Stage Buffer"})
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = "Undo Stage Hunk"})


    -- Git Wide
    map('n', '<leader>gR', gitsigns.reset_buffer, {desc = "Reset Buffer"})
    map('n', '<leader>hp', gitsigns.preview_hunk, {desc = "Preview Hunk"})
    map('n', '<leader>gd', gitsigns.diffthis, {desc = "Diff since last stage"})
    map('n', '<leader>gD', function() gitsigns.diffthis('~') end, {desc = "Diff since HEAD"})
    map('n', '<leader>gt', gitsigns.toggle_deleted, {desc = "Toggle deleted view"})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = "Select Hunk Text Object"})
    map({'o', 'x'}, 'ah', ':<C-U>Gitsigns select_hunk<CR>', {desc = "Select Hunk Text Object"})
  end
}
