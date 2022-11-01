local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

dap.adapters.coreclr = {
    type = "executable",
    command = "/path/to/dotnet/netcoredbg/netcoredbg",
    args = { "--interpreter=vscode" }
}
