local map = vim.keymap.set
local mapping_options = { noremap = true }

map("n", "<Leader>gg", "<CMD>tab Git<CR>", mapping_options)
