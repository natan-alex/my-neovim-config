local map = vim.keymap.set

-- Leave insert mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Save key strokes (now we do not need to press shift to enter command mode).
map({ "n", "x" }, ";", ":")

-- Delete without changing registers
map({ "n", "x" }, "x", '"_x')

-- Clipboard related
map({ "n", "x" }, "<A-y>", '"+y')

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
map("x", "$", "g_")

map("n", "^", "g^")

-- Resize windows with arrows
map("n", "<C-S-Up>", "<CMD>resize +2<CR>")
map("n", "<C-S-Down>", "<CMD>resize -2<CR>")
map("n", "<C-S-Right>", "<CMD>vertical resize -2<CR>")
map("n", "<C-S-Left>", "<CMD>vertical resize +2<CR>")

-- One line at a time
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Keep cursor position after yanking
map("n", "y", "myy")

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

-- Clear search with <esc>
map({ "i", "n" }, "<ESC>", "<CMD>noh<CR><ESC>")

-- Delete a buffer
map("n", "<A-d>", "<CMD>bdelete<CR>")
