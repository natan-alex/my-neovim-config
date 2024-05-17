return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            mode = "n",
            desc = "Go to previous todo comment"
        },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            mode = "n",
            desc = "Go to next todo comment"
        },
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
