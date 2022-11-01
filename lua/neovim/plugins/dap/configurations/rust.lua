local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            local debug_dir = vim.fn.getcwd() .. "/target/debug/"
            return vim.fn.input("Path to executable: ", debug_dir, "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}
