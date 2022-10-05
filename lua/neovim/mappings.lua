local map = vim.keymap.set

local default_options = { noremap = true }

-- Leader
vim.g.mapleader = ";"

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Tabs related
map("n", "<A-l>", ":tabnext<CR>", default_options)
map("n", "<A-h>", ":tabprevious<CR>", default_options)
map("n", "<A-L>", ":tabmove +1<CR>", default_options)
map("n", "<A-H>", ":tabmove -1<CR>", default_options)

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
map("n", "<Leader>qq", "<CMD>q<CR>", default_options)
map("n", "<Leader>qQ", "<CMD>q!<CR>", default_options)
map("n", "<Leader>qa", "<CMD>qa<CR>", default_options)
map("n", "<Leader>qA", "<CMD>qa!<CR>", default_options)

-- Fugitive mappings
map("n", "<Leader>g", ":Git", default_options)

-- Debugging related
map("n", "<Leader>B", "<CMD>lua require('dap').toggle_breakpoint()<CR>", default_options)
map("n", "<F5>", "<CMD>lua require('dap').continue()<CR>", default_options)
map("n", "<F10>", "<CMD>lua require('dap').step_over()<CR>", default_options)
map("n", "<F11>", "<CMD>lua require('dap').step_into()<CR>", default_options)
map("n", "<F12>", "<CMD>lua require('dap').step_out()<CR>", default_options)
