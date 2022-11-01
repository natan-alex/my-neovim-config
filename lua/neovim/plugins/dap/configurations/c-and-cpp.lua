local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            local current_dir = vim.fn.getcwd() .. "/"
            return vim.fn.input("Path to executable: ", current_dir, "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp
