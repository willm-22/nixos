local map = vim.keymap.set
local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }
    map("n", "gd",         vim.lsp.buf.definition,     vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    map("n", "gD",         vim.lsp.buf.declaration,    vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    map("n", "gr",         builtin.lsp_references,     vim.tbl_extend("force", opts, { desc = "References" }))
    map("n", "gi",         vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    map("n", "K",          vim.lsp.buf.hover,          vim.tbl_extend("force", opts, { desc = "Hover docs" }))
    map("n", "<leader>rn", vim.lsp.buf.rename,         vim.tbl_extend("force", opts, { desc = "Rename" }))
    map("n", "<leader>ca", vim.lsp.buf.code_action,    vim.tbl_extend("force", opts, { desc = "Code action" }))
    map("n", "<leader>cf", vim.lsp.buf.format,         vim.tbl_extend("force", opts, { desc = "Format" }))
  end,
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
})

vim.lsp.config("nil_ls", {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.enable({ "pyright", "nil_ls", "lua_ls" })
