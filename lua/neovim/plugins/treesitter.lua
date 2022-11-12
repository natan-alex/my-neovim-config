local treesitter_configs_found, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_configs_found then
    vim.notify("nvim-treesitter.configs module not found. Error: " .. treesitter, "error")
    return
end

treesitter.setup({
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})
