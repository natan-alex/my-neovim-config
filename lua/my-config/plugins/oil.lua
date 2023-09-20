require("oil").setup({})

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "-", "<CMD>Oil<CR>", mapping_options, "Oil Open parent directory")
