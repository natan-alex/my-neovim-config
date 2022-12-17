local neogit = require("neogit")

neogit.setup {
    disable_signs = true,
    integrations = {
        diffview = true
    },
}

local mapping_options = {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["gg"] = { "<CMD>Neogit<CR>", "Toggle neogit" }
}

require("which-key").register(mappings, mapping_options)
