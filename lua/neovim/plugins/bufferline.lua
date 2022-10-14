local was_module_found, bufferline = pcall(require, "bufferline")

if not was_module_found then
    return
end

bufferline.setup({
    options = {
        mode = "tabs",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        enforce_regular_tabs = true,
    },
})
