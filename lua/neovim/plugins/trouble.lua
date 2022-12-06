local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", mapping_options)
map("n", "<leader>xx", "<CMD>TroubleToggle<CR>", mapping_options)
map("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", mapping_options)
map("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", mapping_options)
map("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", mapping_options)
