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
