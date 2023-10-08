return {
    "utilyre/barbecue.nvim",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
    config = function() require("barbecue").setup() end,
}
