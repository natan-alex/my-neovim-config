return {
    "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
        require("nvim-web-devicons").setup()
    end,
}
