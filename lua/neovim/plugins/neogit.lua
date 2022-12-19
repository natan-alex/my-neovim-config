local neogit = require("neogit")

neogit.setup {
    disable_signs = true,
    integrations = {
        diffview = true
    },
}

local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("<Leader>gg", "<CMD>Neogit<CR>", mapping_options, "Toggle neogit")
