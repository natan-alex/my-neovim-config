local map = vim.keymap.set

local default_options = { noremap = true }

-- Leader
vim.g.mapleader = ","

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Bufferline related
map("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", default_options)
map("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", default_options)
map("n", "<A-L>", "<CMD>BufferLineMoveNext<CR>", default_options)
map("n", "<A-H>", "<CMD>BufferLineMovePrev<CR>", default_options)

-- Easy close
map("n", "<C-q><C-q>", "<CMD>q<CR>", default_options)
map("n", "<C-q><C-a>", "<CMD>qa<CR>", default_options)
map("n", "<C-q><C-Q>", "<CMD>q!<CR>", default_options)
map("n", "<C-q><C-A>", "<CMD>qa!<CR>", default_options)

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

-- Fugitive mappings
map("n", "<Leader>gg", "<CMD>tab Git<CR>", default_options)
