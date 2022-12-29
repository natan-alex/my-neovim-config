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
        -- find_files            = { theme = "dropdown" },
        -- oldfiles              = { theme = "dropdown" },
        -- live_grep             = { theme = "dropdown" },
        -- buffers               = { theme = "dropdown" },
        -- diagnostics           = { theme = "dropdown" },
        -- help_tags             = { theme = "dropdown" },
        -- lsp_references        = { theme = "dropdown" },
        -- lsp_document_symbols  = { theme = "dropdown" },
        -- lsp_workspace_symbols = { theme = "dropdown" },
        -- treesitter            = { theme = "dropdown" },
        -- reloader              = { theme = "dropdown" },
        -- builtin               = { theme = "dropdown" },
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
local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map("n", "<Leader>ff", builtin.find_files,            mapping_options, "Telescope Find files")
map("n", "<Leader>fo", builtin.oldfiles,              mapping_options, "Telescope Old files")
map("n", "<Leader>fg", builtin.live_grep,             mapping_options, "Telescope Grep files")
map("n", "<Leader>fs", builtin.grep_string,           mapping_options, "Telescope Grep string")
map("n", "<Leader>fb", builtin.buffers,               mapping_options, "Telescope List buffers")
map("n", "<Leader>fd", builtin.diagnostics,           mapping_options, "Telescope Workspace diagnostics")
map("n", "<Leader>fh", builtin.help_tags,             mapping_options, "Telescope Help tags")
map("n", "<Leader>ft", builtin.treesitter,            mapping_options, "Telescope Treesitter symbols")
map("n", "<Leader>fR", builtin.reloader,              mapping_options, "Telescope Module reloader")
map("n", "<Leader>fB", builtin.builtin,               mapping_options, "Telescope Builtins")
map("n", "<Leader>fr", builtin.lsp_references,        mapping_options, "Telescope Lsp references")
map("n", "<Leader>fS", builtin.lsp_document_symbols,  mapping_options, "Telescope Lsp document symbols")
map("n", "<Leader>fw", builtin.lsp_workspace_symbols, mapping_options, "Telescope Lsp workspace symbols")
