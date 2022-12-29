require("lspsaga").init_lsp_saga({
    definition_action_keys = {
        edit = "o",
        vsplit = "v",
        split = "i",
        tabe = "t",
        quit = "q",
    },
    rename_in_select = false,
    finder_request_timeout = 3000,
})

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "K",          "<CMD>Lspsaga hover_doc<CR>",             mapping_options, "Lspsaga hover")
map("n", "[d",         "<CMD>Lspsaga diagnostic_jump_prev<CR>",  mapping_options, "Lspsaga go to previous diagnostic")
map("n", "]d",         "<CMD>Lspsaga diagnostic_jump_next<CR>",  mapping_options, "Lspsaga go to next diagnostic")
map("n", "gw",         "<CMD>Lspsaga peek_definition<CR>",       mapping_options, "Lspsaga show definition")
map("n", "gr",         "<CMD>Lspsaga lsp_finder<CR>",            mapping_options, "Lspsaga lsp finder")
map("n", "<F2>",       "<CMD>Lspsaga rename<CR>",                mapping_options, "Lspsaga rename symbol")
map("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>",                mapping_options, "Lspsaga rename symbol")
map("n", "<Leader>ca", "<CMD>Lspsaga code_action<CR>",           mapping_options, "Lspsaga code actions")
map("n", "<Leader>ld", "<CMD>Lspsaga show_line_diagnostics<CR>", mapping_options, "Lspsaga show line diagnostics")
