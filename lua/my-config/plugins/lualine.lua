return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = { left = "⚡", right = "⚡" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "diagnostics", "branch" },
      },
    })
  end,
}
