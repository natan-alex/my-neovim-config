return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<Leader>t", "<CMD>ToggleTerm<CR>", desc = "ToggleTerm toggle" },
    },
    config = function()
        require("toggleterm").setup({
            size = 70,

            autochdir = true,
            hide_numbers = true,
            persist_size = true,
            close_on_exit = true,
            start_in_insert = true,
            insert_mappings = true,

            shell = vim.o.shell,

            direction = "float",
            float_opts = { border = "curved" },
        })

        vim.keymap.set("t", "<Leader>t", "<CMD>ToggleTerm<CR>")
    end,
}
