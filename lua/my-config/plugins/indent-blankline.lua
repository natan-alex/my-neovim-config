return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    config = function() require("indent_blankline").setup() end,
}
