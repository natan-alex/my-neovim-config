require("toggleterm").setup({
    size = 75,
    open_mapping = nil,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

local map = require("my-config.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

map({ "n", "t" }, "<Leader>t", "<CMD>ToggleTerm<CR>", mapping_options, "ToggleTerm toggle")
