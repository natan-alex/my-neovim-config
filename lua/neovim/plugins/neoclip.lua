require("neoclip").setup()
require("telescope").load_extension("neoclip")

local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("<Leader>fn", "<CMD>Telescope neoclip<CR>", mapping_options, "Neoclip telescope extension")
