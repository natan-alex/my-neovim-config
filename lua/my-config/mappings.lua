local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ","

-- Leave insert mode
map("i", "jk", "<ESC>", mapping_options)
map("i", "kj", "<ESC>", mapping_options)

-- Delete without changing registers
map({ "n", "x" }, "x", "\"_x", mapping_options)

-- Clipboard related
map({ "n", "x" }, "<A-y>", "\"+y", mapping_options)

-- Resize windows with arrows
map("n", "<C-S-Up>", "<CMD>resize +2<CR>", mapping_options)
map("n", "<C-S-Down>", "<CMD>resize -2<CR>", mapping_options)
map("n", "<C-S-Right>", "<CMD>vertical resize -2<CR>", mapping_options)
map("n", "<C-S-Left>", "<CMD>vertical resize +2<CR>", mapping_options)

-- One line at a time
map("n", "j", "gj", mapping_options)
map("n", "k", "gk", mapping_options)
map("n", "$", "g$", mapping_options)
map("n", "^", "g^", mapping_options)

-- Navigate tab completion with <c-j> and <c-k>
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true, silent = true })
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true, silent = true })
