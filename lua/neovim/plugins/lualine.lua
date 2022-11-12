local lualine_found, lualine = pcall(require, "lualine")

if not lualine_found then
    vim.notify("lualine module not found. Error: " .. lualine, "error")
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
    }
})
