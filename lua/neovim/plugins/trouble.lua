local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("gR"        , "<CMD>TroubleToggle lsp_references<CR>",       mapping_options, "Trouble lsp references")
nmap("<Leader>xl", "<CMD>TroubleToggle loclist<CR>",              mapping_options, "Trouble loclist")
nmap("<Leader>xq", "<CMD>TroubleToggle quickfix<CR>",             mapping_options, "Trouble quickfix")
nmap("<Leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", mapping_options, "Trouble document diagnostics")
nmap("<Leader>xo", "<CMD>TroubleToggle<CR>",                      mapping_options, "Trouble toggle")
