local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", mapping_options)
map("n", "<leader>dl", "<CMD>TroubleToggle loclist<CR>", mapping_options)
map("n", "<leader>dq", "<CMD>TroubleToggle quickfix<CR>", mapping_options)
map("n", "<leader>dd", "<CMD>TroubleToggle document_diagnostics<CR>", mapping_options)
map("n", "<leader>do", "<CMD>TroubleToggle<CR>", mapping_options)
