local map = vim.keymap.set

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  extensions = {
    fzf = {},
  },
})
telescope.load_extension("fzf")

map("n", "<leader>ff", builtin.find_files,  { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep,   { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers,     { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags,   { desc = "Help tags" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fr", builtin.resume,      { desc = "Resume last search" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
