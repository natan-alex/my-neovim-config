local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            local debug_dir = vim.fn.getcwd() .. "/bin/Debug/"
            return vim.fn.input("Path to dll: ", debug_dir, "file")
        end,
    },
}
