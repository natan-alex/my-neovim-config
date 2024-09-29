return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<Leader>tt",
            "<CMD>TodoTrouble<CR>",
            mode = "n",
            desc = "Toggle todo list using Trouble"
        },
    },
    config = function()
        require("todo-comments").setup({})
    end
}
