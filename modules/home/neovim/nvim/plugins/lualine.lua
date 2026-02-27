require("lualine").setup({
  options = {
    -- Stylix sets the theme, so we use 'auto' to inherit terminal colors
    theme = "auto",
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      { "filename", path = 1 },  -- show relative path instead of just filename
    },
  },
})
