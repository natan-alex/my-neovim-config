local neogit = require("neogit")

neogit.setup {
    disable_signs = true,
    integrations = {
        diffview = true
    },
}

local map = require("neovim.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "<Leader>gg", "<CMD>Neogit<CR>", mapping_options, "Toggle neogit")
