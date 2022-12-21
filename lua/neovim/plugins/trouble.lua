local map = require("neovim.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "gR"        , "<CMD>TroubleToggle lsp_references<CR>",       mapping_options, "Trouble lsp references")
map("n", "<Leader>xl", "<CMD>TroubleToggle loclist<CR>",              mapping_options, "Trouble loclist")
map("n", "<Leader>xq", "<CMD>TroubleToggle quickfix<CR>",             mapping_options, "Trouble quickfix")
map("n", "<Leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", mapping_options, "Trouble document diagnostics")
map("n", "<Leader>xo", "<CMD>TroubleToggle<CR>",                      mapping_options, "Trouble toggle")
