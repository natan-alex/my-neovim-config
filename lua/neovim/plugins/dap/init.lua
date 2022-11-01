local was_module_found, dap = pcall(require, "dap")

if not was_module_found then
    return
end

local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "<F5>", dap.continue, mapping_options)
map("n", "<F10>", dap.step_over, mapping_options)
map("n", "<F11>", dap.step_into, mapping_options)
map("n", "<F12>", dap.step_out, mapping_options)

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

local function set_breakpoint_conditionally()
    local condition = vim.fn.input("Breakpoint condition: ")
    dap.set_breakpoint(condition)
end

local mappings = {
    d = {
        B = { set_breakpoint_conditionally, "Set breakpoint conditionally" },
        b = { dap.toggle_breakpoint, "Toggle breakpoint" },
        c = { dap.continue, "Continue" },
        o = { dap.step_over, "Step over" },
        i = { dap.step_into, "Step into" },
        O = { dap.step_out, "Step out" },
        r = { dap.repl.open, "Open Repl" },
    },
}

which_key.register(mappings, which_key_mapping_options)

require("neovim.plugins.dap.dapui")
require("neovim.plugins.dap.adapters")
require("neovim.plugins.dap.configurations")
