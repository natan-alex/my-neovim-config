local mason_found, mason = pcall(require, "mason")

if not mason_found then
    vim.notify("mason module not found. Error: " .. mason, "error")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
