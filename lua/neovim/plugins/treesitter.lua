local was_module_found, treesitter = pcall(require, "nvim-treesitter.configs")

if not was_module_found then
    return
end

treesitter.setup({
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
})
