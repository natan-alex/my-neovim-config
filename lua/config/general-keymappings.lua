local options = require("config.utils.mappings").options({
  noremap = true,
  silent = true,
})

vim.keymap.set("n", ";", ":", options({ silent = false }))
vim.keymap.set("n", "j", "gj", options())
vim.keymap.set("n", "k", "gk", options())
vim.keymap.set("i", "jk", "<esc>", options())
vim.keymap.set("i", "kj", "<esc>", options())

-- Splitting & Resizing
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", options())
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", options())
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", options())
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", options())

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", options())
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", options())
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", options())
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", options())

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", options())
vim.keymap.set("v", ">", ">gv", options())

-- Tab moving
vim.keymap.set("n", "<leader>tl", "<cmd>tabmove +1<cr>", options())
vim.keymap.set("n", "<leader>th", "<cmd>tabmove -1<cr>", options())

-- Buffers
vim.keymap.set("n", "<A-d>", "<cmd>bdelete!<cr>", options())
vim.keymap.set("n", "<A-n>", "<cmd>bnext<cr>", options())
vim.keymap.set("n", "<A-p>", "<cmd>bprevious<cr>", options())
