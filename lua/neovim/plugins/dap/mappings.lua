local dap = require("dap")
local dapui = require("dapui")

local mapping_options = {
    mode = "n",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["<F5>"] = { dap.continue, "Dap continue" },
    ["<F10>"] = { dap.step_over, "Dap step over" },
    ["<F11>"] = { dap.step_into, "Dap step into" },
    ["<F12>"] = { dap.step_out, "Dap step out" },
    ["<Leader>"] = {
        d = {
            s = { dap.continue, "Dap continue" },
            o = { dap.step_over, "Dap step over" },
            i = { dap.step_into, "Dap step into" },
            O = { dap.step_out, "Dap step out" },
            b = { dap.toggle_breakpoint, "Dap toggle breakpoint" },
            r = { dap.repl.open, "Dap repl open" },
            l = { dap.run_last, "Dap run last" },
            c = { dap.run_to_cursor, "Dap run to cursor" },
            C = {
                function()
                    dap.terminate()
                    dap.close()
                    dapui.close()
                end,
                "Dap close"
            },
            B = {
                function()
                    local condition = vim.fn.input("Breakpoint condition: ")
                    dap.set_breakpoint(condition)
                end,
                "Dap set breakpoint on condition"
            }
        },
    },
}

require("which-key").register(mappings, mapping_options)
