local map = require("neovim.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

map("n", "<Leader>vG", ":GenerateVimspectorFile", mapping_options, "Vimspector generate file")
map("n", "<Leader>vI", ":VimspectorInstall",      mapping_options, "Vimspector install gadget")

map("n", "<Leader>vU", "<CMD>VimspectorUpdate<CR>",                   mapping_options, "Vimspector update")
map("n", "<Leader>vB", "<CMD>VimspectorBreakpoints<CR>",              mapping_options, "Vimspector list breakpoints")
map("n", "<Leader>vR", "<CMD>VimspectorReset<CR>",                    mapping_options, "Vimspector reset")
map("n", "<Leader>vs", "<CMD>call vimspector#Launch()<CR>",           mapping_options, "Vimspector launch")
map("n", "<Leader>vS", "<CMD>call vimspector#Stop()<CR>",             mapping_options, "Vimspector stop")
map("n", "<Leader>vr", "<CMD>call vimspector#Restart()<CR>",          mapping_options, "Vimspector restart")
map("n", "<Leader>vc", "<CMD>call vimspector#Continue()<CR>",         mapping_options, "Vimspector continue")
map("n", "<Leader>vC", "<CMD>call vimspector#RunToCursor()<CR>",      mapping_options, "Vimspector run to cursor")
map("n", "<Leader>vo", "<CMD>call vimspector#StepOver()<CR>",         mapping_options, "Vimspector step over")
map("n", "<Leader>vO", "<CMD>call vimspector#StepOut()<CR>",          mapping_options, "Vimspector step out")
map("n", "<Leader>vi", "<CMD>call vimspector#StepInto()<CR>",         mapping_options, "Vimspector step into")
map("n", "<Leader>vb", "<CMD>call vimspector#ToggleBreakpoint()<CR>", mapping_options, "Vimspector toggle breakpoint")

map("n", "<F2>", "<CMD>call vimspector#Launch()<CR>",                   mapping_options, "Vimspector launch")
map("n", "<F3>", "<CMD>call vimspector#Stop()<CR>",                     mapping_options, "Vimspector stop")
map("n", "<F4>", "<CMD>call vimspector#Restart()<CR>",                  mapping_options, "Vimspector restart")
map("n", "<F5>", "<CMD>call vimspector#Continue()<CR>",                 mapping_options, "Vimspector continue")
map("n", "<F7>", "<CMD>call vimspector#RunToCursor()<CR>",              mapping_options, "Vimspector run to cursor")
map("n", "<F8>", "<CMD>call vimspector#ToggleBreakpoint()<CR>",         mapping_options, "Vimspector toggle breakpoint")
map("n", "<F9>", "<CMD>call vimspector#ToggleAdvancedBreakpoint()<CR>", mapping_options, "Toggle conditional breakpoint")
map("n", "<F10>", "<CMD>call vimspector#StepOver()<CR>",                mapping_options, "Vimspector step over")
map("n", "<F11>", "<CMD>call vimspector#StepInto()<CR>",                mapping_options, "Vimspector step into")
map("n", "<F12>", "<CMD>call vimspector#StepOut()<CR>",                 mapping_options, "Vimspector step out")
