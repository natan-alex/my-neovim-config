return {
    "echasnovski/mini.files",
    version = "*",
    keys = {
        {
            "<Leader>e",
            function()
                require("mini.files").open()
            end,
            mode = "n",
            desc = "Open Mini.Files",
        },
    },
    config = function()
        require("mini.files").setup({
            -- Module mappings created only inside explorer.
            -- Use `''` (empty string) to not create one.
            mappings = {
                close = "q",
                go_in = ">",
                go_in_plus = "<CR>",
                go_out = "<",
                go_out_plus = "-",
                mark_goto = "'",
                mark_set = "m",
                reset = "<BS>",
                reveal_cwd = "@",
                show_help = "g?",
                synchronize = "=",
                trim_left = "<C-h>",
                trim_right = "<C-l>",
            },
        })
    end,
}
