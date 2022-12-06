require("neoclip").setup()
require("telescope").load_extension("neoclip")

-- mapping
vim.keymap.set("n", "<Leader>fn", "<CMD>Telescope neoclip<CR>", { noremap = true })
