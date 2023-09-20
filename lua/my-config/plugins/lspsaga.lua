local lspsaga = require("lspsaga")

lspsaga.setup({
    code_action = {
        extend_gitsigns = true,
    },
    definition = {
        keys = {
            edit = "o",
        }
    },
    finder = {
        keys = {
            quit = { "<C-c>", "<ESC>", "q" },
            toggle_or_open = { "o", "<CR>" }
        }
    },
    outline = {
        close_after_jump = true,
        keys = {
            quit = { "<C-c>", "<ESC>", "q" },
            toggle_or_jump = { "o", "<CR>" }
        }
    },
    rename = {
        in_select = false,
        keys = {
            quit = { "<C-c>", "<ESC>" }
        }
    },
    symbol_in_winbar = {
        enable = false
    }
})

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "<C-I>", vim.lsp.buf.format, mapping_options, "Lsp format buffer")
map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, mapping_options, "Lsp signature help")

map("n", "K", "<CMD>Lspsaga hover_doc<CR>", mapping_options, "Lspsaga hover")

map("n", "gr", "<CMD>Lspsaga finder<CR>", mapping_options, "Lspsaga finder")
map("n", "gd", "<CMD>Lspsaga goto_definition<CR>", mapping_options, "Lspsaga go to definition")
map("n", "gt", "<CMD>Lspsaga goto_type_definition<CR>", mapping_options, "Lspsaga go to type definition")

map("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", mapping_options, "Lspsaga go to previous diagnostic")
map("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", mapping_options, "Lspsaga go to next diagnostic")

map("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", mapping_options, "Lspsaga rename")
map("n", "<Leader>ot", "<CMD>Lspsaga outline<CR>", mapping_options, "Lspsaga outline toggle")
map("n", "<Leader>ca", "<CMD>Lspsaga code_action<CR>", mapping_options, "Lspsaga code actions")
map("n", "<Leader>wd", "<CMD>Lspsaga show_workspace_diagnostics<CR>", mapping_options,
    "Lspsaga show workspace diagnostics")
