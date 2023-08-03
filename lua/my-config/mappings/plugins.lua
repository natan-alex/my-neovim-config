local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", mapping_options, "NvimTree toggle")

map("n", "<Leader>ff", "<CMD>Telescope<CR>", mapping_options, "Telescope")

map({ "n", "t" }, "<Leader>t", "<CMD>ToggleTerm<CR>", mapping_options, "ToggleTerm toggle")
