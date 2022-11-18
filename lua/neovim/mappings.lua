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

-- Vimspector
map("n", "<Leader>vG", ":GenerateVimspectorFile", default_options)
map("n", "<Leader>vI", ":VimspectorInstall", default_options)
map("n", "<Leader>vU", "<CMD>VimspectorUpdate<CR>", default_options)
map("n", "<Leader>vB", "<CMD>VimspectorBreakpoints<CR>", default_options)
map("n", "<Leader>vR", "<CMD>VimspectorReset<CR>", default_options)
map("n", "<Leader>vb", "<CMD>call vimspector#ToggleBreakpoint()<CR>", default_options)
map("n", "<Leader>vc", "<CMD>call vimspector#Continue()<CR>", default_options)
map("n", "<Leader>vC", "<CMD>call vimspector#RunToCursor()<CR>", default_options)
map("n", "<Leader>vo", "<CMD>call vimspector#StepOver()<CR>", default_options)
map("n", "<Leader>vO", "<CMD>call vimspector#StepOut()<CR>", default_options)
map("n", "<Leader>vs", "<CMD>call vimspector#Launch()<CR>", default_options)
map("n", "<Leader>vS", "<CMD>call vimspector#Stop()<CR>", default_options)
map("n", "<Leader>vr", "<CMD>call vimspector#Restart()<CR>", default_options)
map("n", "<Leader>vi", "<CMD>call vimspector#StepInto()<CR>", default_options)

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
map("n", "<Leader>tb", "<CMD>Gitsigns toggle_current_line_blame<CR>", default_options)
map("n", "<Leader>hd", "<CMD>Gitsigns diffthis<CR>", default_options)
map("n", "<Leader>td", "<CMD>Gitsigns toggle_deleted<CR>", default_options)
map("n", "<Leader>hb", "<CMD>lua require('gitsigns').blame_line({ full = true })", default_options)
map("n", "<Leader>hD", "<CMD>lua require('gitsigns').diffthis('~')<CR>", default_options)
