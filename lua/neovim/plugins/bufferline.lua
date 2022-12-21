local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
    },
})

local map = require("neovim.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "<A-l>", function() bufferline.cycle(1) end, mapping_options, "Bufferline go right")
map("n", "<A-h>", function() bufferline.cycle(-1) end, mapping_options, "Bufferline go left")
map("n", "<A-L>", function() bufferline.move(1) end, mapping_options, "Bufferline move right")
map("n", "<A-H>", function() bufferline.move(-1) end, mapping_options, "Bufferline move left")
