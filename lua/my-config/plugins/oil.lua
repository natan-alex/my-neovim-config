return {
    "stevearc/oil.nvim",
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Oil Open parent directory" }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({})
    end
}
