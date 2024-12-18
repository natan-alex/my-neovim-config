return {
  "utilyre/barbecue.nvim",
  dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
  config = function()
    require("barbecue").setup()
  end,
}
