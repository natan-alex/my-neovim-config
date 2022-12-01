local toggleterm_found, toggleterm = pcall(require, "toggleterm")

if not toggleterm_found then
    vim.notify("toggleterm module not found. Error: " .. toggleterm, "error")
    return
end

toggleterm.setup({
    size = 75,
    open_mapping = "<Leader>t",
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})
