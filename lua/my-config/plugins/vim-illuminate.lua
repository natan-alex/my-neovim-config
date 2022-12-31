local illuminate = require("illuminate")

local map = require("my-config.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

map("n", "<Leader>it", illuminate.toggle_buf, mapping_options, "Illuminate toggle")
