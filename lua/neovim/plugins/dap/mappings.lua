local dap = require("dap")
local dapui = require("dapui")

local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "<F5>", dap.continue, mapping_options)
map("n", "<F10>", dap.step_over, mapping_options)
map("n", "<F11>", dap.step_into, mapping_options)
map("n", "<F12>", dap.step_out, mapping_options)
map("n", "<Leader>ds", dap.continue, mapping_options)
map("n", "<Leader>do", dap.step_over, mapping_options)
map("n", "<Leader>di", dap.step_into, mapping_options)
map("n", "<Leader>dO", dap.step_out, mapping_options)
map("n", "<Leader>db", dap.toggle_breakpoint, mapping_options)
map("n", "<Leader>dr", dap.repl.open, mapping_options)
map("n", "<Leader>dl", dap.run_last, mapping_options)
map("n", "<Leader>dc", dap.run_to_cursor, mapping_options)

map("n", "<Leader>dC", function()
    dap.terminate()
    dap.close()
    dapui.close()
end, mapping_options)

map("n", "<Leader>dB", function()
    local condition = vim.fn.input("Breakpoint condition: ")
    dap.set_breakpoint(condition)
end, mapping_options)
