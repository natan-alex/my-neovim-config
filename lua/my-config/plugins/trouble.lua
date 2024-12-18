return {
    "folke/trouble.nvim",
    lazy = false,
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "gr",
            "<CMD>Trouble lsp_references toggle focus=true auto_close=true<CR>",
            mode = "n",
            desc = "Trouble show lsp references",
        },
        {
            "gd",
            "<CMD>Trouble lsp_definitions focus=true auto_close=true<CR>",
            mode = "n",
            desc = "Trouble toggle lsp definitions",
        },
        {
            "gi",
            "<CMD>Trouble lsp_implementations focus=true auto_close=true<CR>",
            mode = "n",
            desc = "Trouble toggle lsp implementations",
        },
        {
            "gt",
            "<CMD>Trouble lsp_type_definitions focus=true auto_close=true<CR>",
            mode = "n",
            desc = "Trouble toggle type definitions",
        },
        {
            "<leader>xd",
            "<CMD>Trouble diagnostics toggle focus=true<CR>",
            mode = "n",
            desc = "Trouble toggle diagnostics",
        },
        {
            "<leader>xD",
            "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
            mode = "n",
            desc = "Trouble toggle buffer diagnostics",
        },
        {
            "<leader>xq",
            "<CMD>Trouble quickfix toggle focus=true<CR>",
            mode = "n",
            desc = "Trouble toggle quickfix",
        },
        {
            "<leader>xl",
            "<CMD>Trouble loclist toggle focus=true<CR>",
            mode = "n",
            desc = "Trouble loclist toggle",
        },
        {
            "<leader>xx",
            "<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
            desc = "Trouble lsp definitions / references / ...",
        },
    },
    config = function()
        require("trouble").setup({})
    end,
}
