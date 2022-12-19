local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { noremap = true, silent = true }

nmap("<Leader>vG", ":GenerateVimspectorFile", mapping_options, "Vimspector generate file")
nmap("<Leader>vI", ":VimspectorInstall",      mapping_options, "Vimspector install gadget")

nmap("<Leader>vU", "<CMD>VimspectorUpdate<CR>",                   mapping_options, "Vimspector update")
nmap("<Leader>vB", "<CMD>VimspectorBreakpoints<CR>",              mapping_options, "Vimspector list breakpoints")
nmap("<Leader>vR", "<CMD>VimspectorReset<CR>",                    mapping_options, "Vimspector reset")
nmap("<Leader>vs", "<CMD>call vimspector#Launch()<CR>",           mapping_options, "Vimspector launch")
nmap("<Leader>vS", "<CMD>call vimspector#Stop()<CR>",             mapping_options, "Vimspector stop")
nmap("<Leader>vr", "<CMD>call vimspector#Restart()<CR>",          mapping_options, "Vimspector restart")
nmap("<Leader>vc", "<CMD>call vimspector#Continue()<CR>",         mapping_options, "Vimspector continue")
nmap("<Leader>vC", "<CMD>call vimspector#RunToCursor()<CR>",      mapping_options, "Vimspector run to cursor")
nmap("<Leader>vo", "<CMD>call vimspector#StepOver()<CR>",         mapping_options, "Vimspector step over")
nmap("<Leader>vO", "<CMD>call vimspector#StepOut()<CR>",          mapping_options, "Vimspector step out")
nmap("<Leader>vi", "<CMD>call vimspector#StepInto()<CR>",         mapping_options, "Vimspector step into")
nmap("<Leader>vb", "<CMD>call vimspector#ToggleBreakpoint()<CR>", mapping_options, "Vimspector toggle breakpoint")

nmap("<F2>", "<CMD>call vimspector#Launch()<CR>",                   mapping_options, "Vimspector launch")
nmap("<F3>", "<CMD>call vimspector#Stop()<CR>",                     mapping_options, "Vimspector stop")
nmap("<F4>", "<CMD>call vimspector#Restart()<CR>",                  mapping_options, "Vimspector restart")
nmap("<F5>", "<CMD>call vimspector#Continue()<CR>",                 mapping_options, "Vimspector continue")
nmap("<F7>", "<CMD>call vimspector#RunToCursor()<CR>",              mapping_options, "Vimspector run to cursor")
nmap("<F8>", "<CMD>call vimspector#ToggleBreakpoint()<CR>",         mapping_options, "Vimspector toggle breakpoint")
nmap("<F9>", "<CMD>call vimspector#ToggleAdvancedBreakpoint()<CR>", mapping_options, "Toggle conditional breakpoint")
nmap("<F10>", "<CMD>call vimspector#StepOver()<CR>",                mapping_options, "Vimspector step over")
nmap("<F11>", "<CMD>call vimspector#StepInto()<CR>",                mapping_options, "Vimspector step into")
nmap("<F12>", "<CMD>call vimspector#StepOut()<CR>",                 mapping_options, "Vimspector step out")
