require("neoclip").setup()
require("telescope").load_extension("neoclip")

local map = require("neovim.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "<Leader>fn", "<CMD>Telescope neoclip<CR>", mapping_options, "Neoclip telescope extension")
