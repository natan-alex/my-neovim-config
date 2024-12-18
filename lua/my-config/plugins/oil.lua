return {
  "stevearc/oil.nvim",
  enabled = false,
  keys = {
    { "<Leader>o", "<CMD>Oil<CR>", desc = "Oil Open parent directory" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      keymaps = {
        ["?"] = "actions.show_help",
        ["<"] = "actions.parent",
        [">"] = "actions.select",
        ["<TAB>"] = "actions.select",
      },
    })
  end,
}
