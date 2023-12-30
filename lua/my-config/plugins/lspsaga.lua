local function format_code()
    vim.lsp.buf.format({ async = true, timeout = 3000 })
end

return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<C-I>",      format_code,                                  mode = "n",          desc = "Lsp format buffer" },
        { "<C-k>",      vim.lsp.buf.signature_help,              mode = { "n", "i" }, desc = "Lsp signature help" },

        { "K",          "<CMD>Lspsaga hover_doc<CR>",            mode = "n",          desc = "Lspsaga hover" },

        { "gr",         "<CMD>Lspsaga finder<CR>",               mode = "n",          desc = "Lspsaga finder" },
        { "gd",         "<CMD>Lspsaga goto_definition<CR>",      mode = "n",          desc = "Lspsaga go to definition" },
        { "gt",         "<CMD>Lspsaga goto_type_definition<CR>", mode = "n",          desc = "Lspsaga go to type definition" },

        { "[d",         "<CMD>Lspsaga diagnostic_jump_prev<CR>", mode = "n",          desc = "Lspsaga go to previous diagnostic" },
        { "]d",         "<CMD>Lspsaga diagnostic_jump_next<CR>", mode = "n",          desc = "Lspsaga go to next diagnostic" },

        { "<Leader>rn", "<CMD>Lspsaga rename<CR>",               mode = "n",          desc = "Lspsaga rename" },
        { "<Leader>ot", "<CMD>Lspsaga outline<CR>",              mode = "n",          desc = "Lspsaga outline toggle" },
        { "<Leader>ca", "<CMD>Lspsaga code_action<CR>",          mode = "n",          desc = "Lspsaga code actions" },
        {
            "<Leader>wd",
            "<CMD>Lspsaga show_workspace_diagnostics<CR>",
            mode = "n",
            desc = "Lspsaga show workspace diagnostics",
        },
    },
    config = function()
        local lspsaga = require("lspsaga")

        lspsaga.setup({
            code_action = {
                extend_gitsigns = true,
            },
            definition = {
                keys = {
                    edit = "o",
                },
            },
            finder = {
                keys = {
                    quit = { "<C-c>", "<ESC>", "q" },
                    toggle_or_open = { "o", "<CR>" },
                },
            },
            outline = {
                close_after_jump = true,
                keys = {
                    quit = { "<C-c>", "<ESC>", "q" },
                    toggle_or_jump = { "o", "<CR>" },
                },
            },
            rename = {
                in_select = false,
                keys = {
                    quit = { "<C-c>", "<ESC>" },
                },
            },
            symbol_in_winbar = {
                enable = false,
            },
        })
    end,
}
