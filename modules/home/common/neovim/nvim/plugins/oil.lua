local map = vim.keymap.set

require("oil").setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<C-s>"] = false,  -- disable default horizontal split (conflicts with window nav)
  },
})

map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
