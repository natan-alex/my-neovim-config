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
local mappings = {
    f = { builtin.find_files, "Telescope Find files" },
    o = { builtin.oldfiles, "Telescope Old files" },
    g = { builtin.live_grep, "Telescope Grep files" },
    b = { builtin.buffers, "Telescope List buffers" },
    d = { builtin.diagnostics, "Telescope Workspace diagnostics" },
    h = { builtin.help_tags, "Telescope Help tags" },

    r = { builtin.lsp_references, "Telescope Lsp references" },
    s = { builtin.lsp_document_symbols, "Telescope Document symbols" },
    w = { builtin.lsp_workspace_symbols, "Telescope Workspace symbols" },

    t = { builtin.treesitter, "Telescope Treesitter symbols" },

    R = { builtin.reloader, "Telescope Module reloader" },
    B = { builtin.builtin, "Telescope Builtins" },
}

local mapping_options = {
    mode = "n",
    prefix = "<Leader>f",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

require("which-key").register(mappings, mapping_options)

