local map = vim.keymap.set

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local opts = { buffer = bufnr }
    map("n", "]c", gs.next_hunk,          vim.tbl_extend("force", opts, { desc = "Next hunk" }))
    map("n", "[c", gs.prev_hunk,          vim.tbl_extend("force", opts, { desc = "Prev hunk" }))
    map("n", "<leader>hs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
    map("n", "<leader>hr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
    map("n", "<leader>hp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
    map("n", "<leader>hb", gs.blame_line,  vim.tbl_extend("force", opts, { desc = "Blame line" }))
  end,
})
