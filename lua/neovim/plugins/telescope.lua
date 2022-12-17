local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        prompt_prefix = "🔭  ",
        selection_caret = "»  ",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<ESC>"] = actions.close,
                ["<C-c>"] = actions.close,
            },
            n = {
                ["q"] = actions.close,
                ["<ESC>"] = actions.close,
                ["<C-c>"] = actions.close,

                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["M"] = actions.move_to_middle,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["?"] = actions.which_key,
            },
        }
    },
    pickers = {
        find_files            = { theme = "ivy" },
        oldfiles              = { theme = "ivy" },
        live_grep             = { theme = "ivy" },
        buffers               = { theme = "ivy" },
        diagnostics           = { theme = "ivy" },
        help_tags             = { theme = "ivy" },
        lsp_references        = { theme = "ivy" },
        lsp_document_symbols  = { theme = "ivy" },
        lsp_workspace_symbols = { theme = "ivy" },
        treesitter            = { theme = "ivy" },
        reloader              = { theme = "ivy" },
        builtin               = { theme = "ivy" },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
        }
    },
})

-- mappings
local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "<Leader>ff", builtin.find_files, mapping_options)
map("n", "<Leader>fo", builtin.oldfiles, mapping_options)
map("n", "<Leader>fg", builtin.live_grep, mapping_options)
map("n", "<Leader>fb", builtin.buffers, mapping_options)
map("n", "<Leader>fd", builtin.diagnostics, mapping_options)
map("n", "<Leader>fh", builtin.help_tags, mapping_options)

map("n", "<Leader>fr", builtin.lsp_references, mapping_options)
map("n", "<Leader>fs", builtin.lsp_document_symbols, mapping_options)
map("n", "<Leader>fw", builtin.lsp_workspace_symbols, mapping_options)

map("n", "<Leader>ft", builtin.treesitter, mapping_options)

map("n", "<Leader>fR", builtin.reloader, mapping_options)
map("n", "<Leader>fB", builtin.builtin, mapping_options)
