local mapping_options = {
    mode = "n",
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["<Leader>"] = {
        d = {
            l = { "<CMD>TroubleToggle loclist<CR>", "Trouble loclist" },
            q = { "<CMD>TroubleToggle quickfix<CR>", "Trouble quickfix" },
            d = { "<CMD>TroubleToggle document_diagnostics<CR>", "Trouble document diagnostics" },
            o = { "<CMD>TroubleToggle<CR>", "Trouble toggle" },
        }
    },
    ["gR"] = { "<CMD>TroubleToggle lsp_references<CR>", "Trouble lsp references" },
}

require("which-key").register(mappings, mapping_options)
