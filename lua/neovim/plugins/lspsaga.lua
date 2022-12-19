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

local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("K",          "<CMD>Lspsaga hover_doc<CR>",             mapping_options, "Lspsaga hover")
nmap("[d",         "<CMD>Lspsaga diagnostic_jump_prev<CR>",  mapping_options, "Lspsaga go to previous diagnostic")
nmap("]d",         "<CMD>Lspsaga diagnostic_jump_next<CR>",  mapping_options, "Lspsaga go to next diagnostic")
nmap("gD",         "<CMD>Lspsaga peek_definition<CR>",       mapping_options, "Lspsaga show definition")
nmap("gr",         "<CMD>Lspsaga lsp_finder<CR>",            mapping_options, "Lspsaga lsp finder")
nmap("<F2>",       "<CMD>Lspsaga rename<CR>",                mapping_options, "Lspsaga rename symbol")
nmap("<Leader>rn", "<CMD>Lspsaga rename<CR>",                mapping_options, "Lspsaga rename symbol")
nmap("<Leader>ca", "<CMD>Lspsaga code_action<CR>",           mapping_options, "Lspsaga code actions")
nmap("<Leader>ld", "<CMD>Lspsaga show_line_diagnostics<CR>", mapping_options, "Lspsaga show line diagnostics")
