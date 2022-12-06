local dap = require("dap")
local dapui = require("dapui")

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
