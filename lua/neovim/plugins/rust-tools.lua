local rust_tools_found, rust_tools = pcall(require, "rust-tools")

if not rust_tools_found then
    vim.notify("rust-tools module not found. Error: " .. rust_tools, "error")
    return
end

local opts = {
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

rust_tools.setup(opts)
