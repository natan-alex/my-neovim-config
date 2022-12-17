require("lspsaga").init_lsp_saga({
    definition_action_keys = {
        edit = "<Leader>o",
        vsplit = "<Leader>v",
        split = "<Leader>i",
        tabe = "<Leader>t",
        quit = "q",
    },
    rename_in_select = false,
    finder_request_timeout = 3000,
})

local mapping_options = {
    mode = "n",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["<F2>"] = { "<CMD>Lspsaga rename<CR>", "Lspsaga rename symbol" },
    ["<Leader>"] = {
        ["rn"] = { "<CMD>Lspsaga rename<CR>", "Lspsaga rename symbol" },
        ["ca"] = { "<CMD>Lspsaga code_action<CR>", "Lspsaga code actions" },
        ["cd"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Lspsaga show line diagnostics" },
    },
    ["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Lspsaga hover" },
    ["[d"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", "Lspsaga go to previous diagnostic" },
    ["]d"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Lspsaga go to next diagnostic" },
    ["gD"] = { "<CMD>Lspsaga peek_definition<CR>", "Lspsaga show definition" },
    ["gr"] = { "<CMD>Lspsaga lsp_finder<CR>", "Lspsaga lsp finder" },
}

require("which-key").register(mappings, mapping_options)
