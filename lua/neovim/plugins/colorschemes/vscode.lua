local was_module_found, vscode = pcall(require, "vscode")

if not was_module_found then
    return
end

vscode.setup({
    -- Enable italic comment
    italic_comments = true,
})
