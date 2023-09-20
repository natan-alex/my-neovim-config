local lspsaga = require("lspsaga")

lspsaga.setup({
    symbol_in_winbar = {
        enable = false
    }
})

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "<C-I>", vim.lsp.buf.format, mapping_options, "Lsp format buffer")

map("n", "K", "<CMD>Lspsaga hover_doc<CR>", mapping_options, "Lspsaga hover")

map("n", "gF", "<CMD>Lspsaga finder<CR>", mapping_options, "Lspsaga finder")
map("n", "gd", "<CMD>Lspsaga goto_type_definition<CR>", mapping_options, "Lspsaga go to type definition")
map("n", "gD", "<CMD>Lspsaga goto_definition<CR>", mapping_options, "Lspsaga go to variable definition")

map("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", mapping_options, "Lspsaga go to previous diagnostic")
map("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", mapping_options, "Lspsaga go to next diagnostic")

map("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", mapping_options, "Lspsaga rename")
map("n", "<Leader>ot", "<CMD>Lspsaga outline<CR>", mapping_options, "Lspsaga outline toggle")
map("n", "<Leader>ca", "<CMD>Lspsaga code_action<CR>", mapping_options, "Lspsaga code actions")
map("n", "<Leader>wd", "<CMD>Lspsaga show_workspace_diagnostics<CR>", mapping_options,
    "Lspsaga show workspace diagnostics")
