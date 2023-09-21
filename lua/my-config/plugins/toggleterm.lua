require("toggleterm").setup({
    size = 70,

    autochdir = true,
    hide_numbers = true,
    persist_size = true,
    close_on_exit = true,
    start_in_insert = true,
    insert_mappings = true,

    direction = "float",
    float_opts = { border = "curved" },
})

local Terminal = require("toggleterm.terminal").Terminal

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true }


local lazygit = Terminal:new({
    cmd = "lazygit",

    hidden = true,
    hide_numbers = true,
    start_in_insert = true,

    on_open = function(term)
        mapping_options.buffer = term.bufnr
        map("n", "q", "<CMD>close<CR>", mapping_options, "")
    end,
})

map("n", "<leader>lg", function()
    lazygit:toggle()
end, mapping_options, "Toggleterm open with lazygit")
