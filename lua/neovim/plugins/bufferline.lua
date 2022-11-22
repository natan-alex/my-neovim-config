local bufferline_found, bufferline = pcall(require, "bufferline")

if not bufferline_found then
    vim.notify("bufferline module not found. Error: " .. bufferline, "error")
    return
end

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
    },
})

vim.keymap.set("n", "<A-l>", function() bufferline.cycle(1) end, { noremap = true })
vim.keymap.set("n", "<A-h>", function() bufferline.cycle(-1) end, { noremap = true })
vim.keymap.set("n", "<A-L>", function() bufferline.move(1) end, { noremap = true })
vim.keymap.set("n", "<A-H>", function() bufferline.move(-1) end, { noremap = true })
