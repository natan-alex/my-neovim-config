if vim.fn.exists("neovide") == 0 then
    return
end

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_antialiasing = true


vim.keymap.set({ "v", "n" }, "<C-S-c>", [["+y]], { noremap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-S-v>", [[<C-r>+]], { noremap = true, silent = true })
