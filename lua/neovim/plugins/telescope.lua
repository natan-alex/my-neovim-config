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
local nmap = require("neovim.utils.mappings").nmap
local mapping_options = { silent = true, noremap = true, }

nmap("<Leader>ff", builtin.find_files,            mapping_options, "Telescope Find files")
nmap("<Leader>fo", builtin.oldfiles,              mapping_options, "Telescope Old files")
nmap("<Leader>fg", builtin.live_grep,             mapping_options, "Telescope Grep files")
nmap("<Leader>fb", builtin.buffers,               mapping_options, "Telescope List buffers")
nmap("<Leader>fd", builtin.diagnostics,           mapping_options, "Telescope Workspace diagnostics")
nmap("<Leader>fh", builtin.help_tags,             mapping_options, "Telescope Help tags")
nmap("<Leader>ft", builtin.treesitter,            mapping_options, "Telescope Treesitter symbols")
nmap("<Leader>fR", builtin.reloader,              mapping_options, "Telescope Module reloader")
nmap("<Leader>fB", builtin.builtin,               mapping_options, "Telescope Builtins")
nmap("<Leader>fr", builtin.lsp_references,        mapping_options, "Telescope Lsp references")
nmap("<Leader>fs", builtin.lsp_document_symbols,  mapping_options, "Telescope Lsp document symbols")
nmap("<Leader>fw", builtin.lsp_workspace_symbols, mapping_options, "Telescope Lsp workspace symbols")
