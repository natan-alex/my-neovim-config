return {
    "utilyre/barbecue.nvim",
    event = "VimEnter",
    dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
    config = function() require("barbecue").setup() end,
}
