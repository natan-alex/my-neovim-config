local map = vim.keymap.set

local default_options = { 
    noremap = true, 
    silent = true 
}

-- Leader
vim.g.mapleader = ";"

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Tabs navigation
map("n", "<A-l>", ":tabnext<CR>", default_options)
map("n", "<A-h>", ":tabprevious<CR>", default_options)

-- Delete without changing registers
map({"n", "x"}, "x", "\"_x", default_options)

-- Clipboard related
map({"n", "x"}, "<A-y>", "\"+y", default_options)
map({"n", "x"}, "<A-p>", "\"+p", default_options)

-- Explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", default_options)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", default_options)
map("n", "<C-j>", "<C-w>j", default_options)
map("n", "<C-k>", "<C-w>k", default_options)
map("n", "<C-l>", "<C-w>l", default_options)

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", default_options)
map("n", "<C-Down>", ":resize -2<CR>", default_options)
map("n", "<C-Right>", ":vertical resize -2<CR>", default_options)
map("n", "<C-Left>", ":vertical resize +2<CR>", default_options)

-- One line at a time
map("n", "j", "gj", default_options)
map("n", "k", "gk", default_options)
map("n", "$", "g$", default_options)
map("n", "^", "g^", default_options)

-- Space mappings
map("n", "<Space>q", ":q<CR>", default_options)
