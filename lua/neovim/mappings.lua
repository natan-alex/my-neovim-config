local map = vim.keymap.set

local default_options = { noremap = true }

-- Leader
vim.g.mapleader = ","

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Bufferline related
map("n", "<A-l>", "<CMD>BufferNext<CR>", default_options)
map("n", "<A-h>", "<CMD>BufferPrevious<CR>", default_options)
map("n", "<A-L>", "<CMD>BufferMoveNext<CR>", default_options)
map("n", "<A-H>", "<CMD>BufferMovePrevious<CR>", default_options)
map("n", "<A-q>", "<CMD>BufferClose<CR>", default_options)

-- Delete without changing registers
map({ "n", "x" }, "x", "\"_x", default_options)

-- Clipboard related
map({ "n", "x" }, "<A-y>", "\"+y", default_options)
map({ "n", "x" }, "<A-p>", "\"+p", default_options)

-- Explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", default_options)

-- Resize windows with arrows
map("n", "<C-S-Up>", ":horizontal resize +2<CR>", default_options)
map("n", "<C-S-Down>", ":horizontal resize -2<CR>", default_options)
map("n", "<C-S-Right>", ":vertical resize -2<CR>", default_options)
map("n", "<C-S-Left>", ":vertical resize +2<CR>", default_options)

-- One line at a time
map("n", "j", "gj", default_options)
map("n", "k", "gk", default_options)
map("n", "$", "g$", default_options)
map("n", "^", "g^", default_options)

-- Fugitive mappings
map("n", "<Leader>G", ":Git", default_options)
