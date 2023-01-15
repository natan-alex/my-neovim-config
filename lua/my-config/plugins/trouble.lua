local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "gR"        , "<CMD>TroubleToggle lsp_references<CR>",       mapping_options, "Trouble lsp references")
map("n", "<Leader>dl", "<CMD>TroubleToggle loclist<CR>",              mapping_options, "Trouble loclist")
map("n", "<Leader>dq", "<CMD>TroubleToggle quickfix<CR>",             mapping_options, "Trouble quickfix")
map("n", "<Leader>dd", "<CMD>TroubleToggle document_diagnostics<CR>", mapping_options, "Trouble document diagnostics")
map("n", "<Leader>do", "<CMD>TroubleToggle<CR>",                      mapping_options, "Trouble toggle")
