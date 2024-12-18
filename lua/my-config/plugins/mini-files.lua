return {
    "echasnovski/mini.files",
    version = "*",
    keys = {
        {
            "-",
            function()
                local mini_files = require("mini.files")

                if mini_files.close() then return end

                local path = vim.api.nvim_buf_get_name(0)

                if vim.fn.filereadable(path) == 1 then
                    mini_files.open(path, false)
                else
                    mini_files.open()
                end
            end,
            mode = "n",
            desc = "Toggle Mini.Files",
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
                reveal_cwd = "<space>",
                show_help = "g?",
                synchronize = "=",
                trim_left = "<C-h>",
                trim_right = "<C-l>",
            },
        })
    end,
}
