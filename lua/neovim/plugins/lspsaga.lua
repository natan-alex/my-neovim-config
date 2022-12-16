require("lspsaga").init_lsp_saga({
    definition_action_keys = {
        edit = "<Space>o",
        vsplit = "<Space>v",
        split = "<Space>i",
        tabe = "<Space>t",
        quit = "q",
    },
    rename_in_select = false,
    finder_request_timeout = 3000,
})

local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "K", "<CMD>Lspsaga hover_doc<CR>", mapping_options)
map("n", "gr", "<CMD>Lspsaga lsp_finder<CR>", mapping_options)
map("n", "gd", "<CMD>Lspsaga peek_definition<CR>", mapping_options)
map("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", mapping_options)
map("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", mapping_options)
map("n", "<F2>", "<CMD>Lspsaga rename<CR>", mapping_options)
map("n", "<Leader>ca", "<CMD>Lspsaga code_action<CR>", mapping_options)
map("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", mapping_options)
map("n", "<Leader>cd", "<CMD>Lspsaga show_line_diagnostics<CR>", mapping_options)
map("n", "<Leader>o", "<CMD>Lspsaga outline<CR>", mapping_options)
