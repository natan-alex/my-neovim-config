local was_module_found, bufferline = pcall(require, "bufferline")

if not was_module_found then
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

local map = vim.keymap.set
local mapping_options = { noremap = true }

map("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", mapping_options)
map("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", mapping_options)
map("n", "<A-L>", "<CMD>BufferLineMoveNext<CR>", mapping_options)
map("n", "<A-H>", "<CMD>BufferLineMovePrev<CR>", mapping_options)
