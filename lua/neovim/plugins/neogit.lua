local was_module_found, neogit = pcall(require, "neogit")

if not was_module_found then
    return
end

neogit.setup({
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = "tab",
    integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        diffview = true
    },
})
