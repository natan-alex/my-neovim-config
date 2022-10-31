local map = vim.keymap.set

local default_options = { noremap = true }

-- Leader
vim.g.mapleader = ","

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Delete without changing registers
map({ "n", "x" }, "x", "\"_x", default_options)

-- Clipboard related
map({ "n", "x" }, "<A-y>", "\"+y", default_options)
map({ "n", "x" }, "<A-p>", "\"+p", default_options)

-- Explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", default_options)

-- Resize windows with arrows
map("n", "<C-S-Up>", ":resize +2<CR>", default_options)
map("n", "<C-S-Down>", ":resize -2<CR>", default_options)
map("n", "<C-S-Right>", ":vertical resize -2<CR>", default_options)
map("n", "<C-S-Left>", ":vertical resize +2<CR>", default_options)

-- One line at a time
map("n", "j", "gj", default_options)
map("n", "k", "gk", default_options)
map("n", "$", "g$", default_options)
map("n", "^", "g^", default_options)
