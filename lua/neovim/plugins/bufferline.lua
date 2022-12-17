local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
    },
})

local mapping_options = {
    mode = "n",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["<A-l>"] = { function() bufferline.cycle(1) end, "Bufferline go right" },
    ["<A-h>"] = { function() bufferline.cycle(-1) end, "Bufferline go left" },
    ["<A-L>"] = { function() bufferline.move(1) end, "Bufferline move right" },
    ["<A-H>"] = { function() bufferline.move(-1) end, "Bufferline move left" },
}

require("which-key").register(mappings, mapping_options)
