local was_dap_module_found, dap = pcall(require, "dap")

if not was_dap_module_found then
    return
end

local was_dapui_module_found, dapui = pcall(require, "dapui")

if not was_dapui_module_found then
    return
end

dapui.setup({
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.40 },
                { id = "watches", size = 0.30 },
                { id = "breakpoints", size = 0.30 },
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = { "repl" },
            size = 0.40, -- % of total lines
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


local was_which_key_module_found, which_key = pcall(require, "which-key")

if not was_which_key_module_found then
    return
end

local which_key_mapping_options = {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

which_key.register({
    d = {
        C = { dapui.close, "Close ui" }
    },
}, which_key_mapping_options)
