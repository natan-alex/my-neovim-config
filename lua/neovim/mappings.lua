local map = vim.keymap.set

local default_options = { noremap = true }

-- Leader
vim.g.mapleader = ","

-- Leave insert mode
map("i", "jk", "<ESC>", default_options)
map("i", "kj", "<ESC>", default_options)

-- Delete without changing registers
map({ "n", "x" }, "x", "\"_x", default_options)

-- Clipboard related
map({ "n", "x" }, "<A-y>", "\"+y", default_options)
map({ "n", "x" }, "<A-p>", "\"+p", default_options)

-- Explorer
map("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", default_options)

-- Resize windows with arrows
map("n", "<C-S-Up>", "<CMD>resize +2<CR>", default_options)
map("n", "<C-S-Down>", "<CMD>resize -2<CR>", default_options)
map("n", "<C-S-Right>", "<CMD>vertical resize -2<CR>", default_options)
map("n", "<C-S-Left>", "<CMD>vertical resize +2<CR>", default_options)

-- One line at a time
map("n", "j", "gj", default_options)
map("n", "k", "gk", default_options)
map("n", "$", "g$", default_options)
map("n", "^", "g^", default_options)

-- Telescope
map("n", "<Leader>ff", "<CMD>Telescope find_files<CR>", default_options)
map("n", "<Leader>fr", "<CMD>Telescope oldfiles<CR>", default_options)
map("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>", default_options)
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", default_options)
map("n", "<Leader>fd", "<CMD>Telescope diagnostics<CR>", default_options)
map("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", default_options)
map("n", "<Leader>gs", "<CMD>Telescope git_status<CR>", default_options)
map("n", "<Leader>gb", "<CMD>Telescope git_branches<CR>", default_options)
map("n", "<Leader>gc", "<CMD>Telescope git_commits<CR>", default_options)

-- Git
map("n", "<Leader>gg", "<CMD>Neogit<CR>", default_options)

-- Terminal
map("n", "<Leader>tt", "<CMD>ToggleTerm<CR>", default_options)

-- BufferLine
map("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", default_options)
map("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", default_options)
map("n", "<A-L>", "<CMD>BufferLineMoveNext<CR>", default_options)
map("n", "<A-H>", "<CMD>BufferLineMovePrev<CR>", default_options)

-- Lsp saga
map("n", "K", "<CMD>Lspsaga hover_doc<CR>", default_options)
map("n", "gr", "<CMD>Lspsaga lsp_finder<CR>", default_options)
map("n", "gd", "<CMD>Lspsaga peek_definition<CR>", default_options)
map("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", default_options)
map("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", default_options)
map("n", "[e", "lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })", default_options)
map("n", "]e", "lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })", default_options)
map("n", "<Leader>o", "<CMD>LSoutlineToggle<CR>", default_options)
map("n", "<Leader>ca", "<CMD>Lspsaga code_action<CR>", default_options)
map("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", default_options)
map("n", "<Leader>ld", "<CMD>Lspsaga show_line_diagnostics<CR>", default_options)
map("n", "<Leader>cd", "<CMD>Lspsaga show_cursor_diagnostics<CR>", default_options)

-- Aerial
map("n", "<Leader>a", "<CMD>AerialToggle<CR>")

-- Gitsigns
map({"n", "v"}, "<Leader>hs", "<CMD>Gitsigns stage_hunk<CR>", default_options)
map({"n", "v"}, "<Leader>hr", "<CMD>Gitsigns reset_hunk<CR>", default_options)
map("n", "<Leader>hS", "<CMD>Gitsigns stage_buffer<CR>", default_options)
map("n", "<Leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", default_options)
map("n", "<Leader>hR", "<CMD>Gitsigns reset_buffer<CR>", default_options)
map("n", "<Leader>hp", "<CMD>Gitsigns preview_hunk<CR>", default_options)
map("n", "<Leader>hl", "<CMD>Gitsigns toggle_current_line_blame<CR>", default_options)
map("n", "<Leader>hd", "<CMD>Gitsigns diffthis<CR>", default_options)
map("n", "<Leader>hD", "<CMD>Gitsigns toggle_deleted<CR>", default_options)

-- Dap
map("n", "<F5>", "<CMD>lua require('dap').continue()<CR>", default_options)
map("n", "<F10>", "<CMD>lua require('dap').step_over()<CR>", default_options)
map("n", "<F11>", "<CMD>lua require('dap').step_into()<CR>", default_options)
map("n", "<F12>", "<CMD>lua require('dap').step_out()<CR>", default_options)
map("n", "<Leader>ds", "<CMD>lua require('dap').continue()<CR>", default_options)
map("n", "<Leader>do", "<CMD>lua require('dap').step_over()<CR>", default_options)
map("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", default_options)
map("n", "<Leader>dO", "<CMD>lua require('dap').step_out()<CR>", default_options)
map("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", default_options)
map("n", "<Leader>dB", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", default_options)
map("n", "<Leader>dr", "<CMD>lua require('dap').repl.open()<CR>", default_options)
map("n", "<Leader>dl", "<CMD>lua require('dap').run_last()<CR>", default_options)
map("n", "<Leader>dc", "<CMD>lua require('dap').run_to_cursor()<CR>", default_options)
map("n", "<Leader>dC", "<CMD>lua require('dap').terminate(); require('dap').close(); require('dapui').close()<CR>", default_options)
