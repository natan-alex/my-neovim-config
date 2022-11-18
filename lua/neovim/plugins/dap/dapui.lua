local dap_found, dap = pcall(require, "dap")

if not dap_found then
    vim.notify("dap module not found. Error: " .. dap, "error")
    return
end

local dapui_found, dapui = pcall(require, "dapui")

if not dapui_found then
    vim.notify("dapui module not found. Error: " .. dapui, "error")
    return
end

dapui.setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.4 },
                { id = "breakpoints", size = 0.3 },
                -- "stacks",
                { id = "watches", size = 0.3 },
            },
            size = 30, -- xx columns
            position = "left",
        },
        {
            elements = { "repl" },
            size = 0.35, -- xx% of total lines
            position = "bottom",
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
