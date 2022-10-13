local was_module_found, lualine = pcall(require, "lualine")

if not was_module_found then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
    }
})
