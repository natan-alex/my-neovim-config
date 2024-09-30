return {
    "echasnovski/mini.files",
    version = "*",
    keys = {
        {
            "<Leader>me",
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
                go_in = "",
                go_in_plus = "<A-l>",
                go_out = "",
                go_out_plus = "<A-h>",
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
