local dap = require("dap")
local dapui = require("dapui")

local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("<F5>",       dap.continue,          mapping_options, "Dap continue")
nmap("<F10>",      dap.step_over,         mapping_options, "Dap step over")
nmap("<F11>",      dap.step_into,         mapping_options, "Dap step into")
nmap("<F12>",      dap.step_out,          mapping_options, "Dap step out")
nmap("<Leader>ds", dap.continue,          mapping_options, "Dap continue")
nmap("<Leader>do", dap.step_over,         mapping_options, "Dap step over")
nmap("<Leader>di", dap.step_into,         mapping_options, "Dap step into")
nmap("<Leader>dO", dap.step_out,          mapping_options, "Dap step out")
nmap("<Leader>db", dap.toggle_breakpoint, mapping_options, "Dap toggle breakpoint")
nmap("<Leader>dr", dap.repl.open,         mapping_options, "Dap repl open")
nmap("<Leader>dl", dap.run_last,          mapping_options, "Dap run last")
nmap("<Leader>dc", dap.run_to_cursor,     mapping_options, "Dap run to cursor")

nmap("<Leader>dC",
    function()
        dap.terminate()
        dap.close()
        dapui.close()
    end,
    mapping_options,
    "Dap close"
)
nmap("<Leader>dB",
    function()
        local condition = vim.fn.input("Breakpoint condition: ")
        dap.set_breakpoint(condition)
    end,
    mapping_options,
    "Dap set breakpoint on condition"
)
