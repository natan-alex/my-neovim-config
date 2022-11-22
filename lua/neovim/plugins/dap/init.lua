local dap_found, dap = pcall(require, "dap")

if not dap_found then
    vim.notify("dap module not found. Error: " .. dap, "error")
    return
end

dap.adapters.coreclr = {
    type = "executable",
    command = "/home/natan/.local/share/nvim/mason/bin/netcoredbg",
    args = {"--interpreter=vscode"}
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        stopAtEntry = function()
            return vim.fn.input("Stop at entry? [y/n]: ") == "y"
        end,
        program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd(), "file")
        end,
    },
}

require("neovim.plugins.dap.mappings")
