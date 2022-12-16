local neogit = require("neogit")

neogit.setup {
    disable_signs = true,
    integrations = {
        diffview = true
    },
}

vim.keymap.set("n", "<Leader>gg", "<CMD>Neogit<CR>", { noremap = true, silent = true })
