return {
    "echasnovski/mini.trailspace",
    version = "*",
    config = function()
        require("mini.trailspace").setup({})

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup(
                "remove-trailing-spaces",
                { clear = true }
            ),
            callback = function()
                require("mini.trailspace").trim()
            end,
        })
    end,
}
