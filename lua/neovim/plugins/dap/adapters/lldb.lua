local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}
