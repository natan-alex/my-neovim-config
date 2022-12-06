local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
    },
})

local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "<A-l>", function() bufferline.cycle(1) end, mapping_options)
map("n", "<A-h>", function() bufferline.cycle(-1) end, mapping_options)
map("n", "<A-L>", function() bufferline.move(1) end, mapping_options)
map("n", "<A-H>", function() bufferline.move(-1) end, mapping_options)
