local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
    },
})

local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("<A-l>", function() bufferline.cycle(1) end, mapping_options, "Bufferline go right")
nmap("<A-h>", function() bufferline.cycle(-1) end, mapping_options, "Bufferline go left")
nmap("<A-L>", function() bufferline.move(1) end, mapping_options, "Bufferline move right")
nmap("<A-H>", function() bufferline.move(-1) end, mapping_options, "Bufferline move left")
