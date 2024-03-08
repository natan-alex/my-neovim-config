return {
    "stevearc/oil.nvim",
    keys = {
        { "<Leader>E", "<CMD>Oil<CR>", desc = "Oil Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                ["?"] = "actions.show_help",
                [">"] = "actions.select",
                ["<"] = "actions.parent",
            },
        })
    end,
}
