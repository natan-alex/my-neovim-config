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

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", options())
vim.keymap.set("v", ">", ">gv", options())

-- Buffers
vim.keymap.set(
  "n",
  "gn",
  "<cmd>bnext<cr>",
  options({ desc = "Go to next buffer" })
)

vim.keymap.set(
  "n",
  "gp",
  "<cmd>bprevious<cr>",
  options({ desc = "Go to previous buffer" })
)
