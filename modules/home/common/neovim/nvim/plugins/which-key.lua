require("which-key").setup()

require("which-key").add({
  { "<leader>f", group = "find" },
  { "<leader>h", group = "git hunks" },
  { "<leader>c", group = "code" },
  { "<leader>q", group = "quickfix" },
})
