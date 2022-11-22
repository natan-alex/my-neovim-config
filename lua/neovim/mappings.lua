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

-- Resize windows with arrows
map("n", "<C-S-Up>", "<CMD>resize +2<CR>", default_options)
map("n", "<C-S-Down>", "<CMD>resize -2<CR>", default_options)
map("n", "<C-S-Right>", "<CMD>vertical resize -2<CR>", default_options)
map("n", "<C-S-Left>", "<CMD>vertical resize +2<CR>", default_options)

-- One line at a time
map("n", "j", "gj", default_options)
map("n", "k", "gk", default_options)
map("n", "$", "g$", default_options)
map("n", "^", "g^", default_options)

-- Navigation
map("i", "<A-Up>", "<C-\\><C-N><C-w>k", default_options)
map("i", "<A-Down>", "<C-\\><C-N><C-w>j", default_options)
map("i", "<A-Left>", "<C-\\><C-N><C-w>h", default_options)
map("i", "<A-Right>", "<C-\\><C-N><C-w>l", default_options)
map("n", "<A-Up>", "<C-w>k", default_options)
map("n", "<A-Down>", "<C-w>j", default_options)
map("n", "<A-Left>", "<C-w>h", default_options)
map("n", "<A-Right>", "<C-w>l", default_options)

-- Navigate tab completion with <c-j> and <c-k>
map("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
map("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
