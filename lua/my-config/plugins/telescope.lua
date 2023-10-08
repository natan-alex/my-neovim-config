return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = function()
            if vim.g.is_linux or vim.g.is_mac then
                return "make"
            end

            return
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        after = "nvim-telescope/telescope-fzf-native.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    prompt_prefix = "🔭  ",
                    selection_caret = "»  ",
                    layout_strategy = "vertical",
                    sorting_strategy = "ascending",
                    path_display = { "truncate " },
                    layout_config = {
                        width = 0.8,
                        height = 0.95,
                        prompt_position = "top",
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim"
                    },
                    mappings = {
                        i = {
                            ["<C-n>"]  = actions.move_selection_next,
                            ["<C-j>"]  = actions.move_selection_next,
                            ["<C-p>"]  = actions.move_selection_previous,
                            ["<C-k>"]  = actions.move_selection_previous,

                            ["<Up>"]   = actions.cycle_history_prev,
                            ["<Down>"] = actions.cycle_history_next,

                            ["<C-x>"]  = actions.select_horizontal,
                            ["<C-v>"]  = actions.select_vertical,
                            ["<C-t>"]  = actions.select_tab,

                            ["<ESC>"]  = actions.close,
                            ["<C-c>"]  = actions.close,
                            ["<C-u>"]  = false
                        },
                        n = {
                            ["q"]     = actions.close,
                            ["<ESC>"] = actions.close,
                            ["<C-c>"] = actions.close,

                            ["gg"]    = actions.move_to_top,
                            ["G"]     = actions.move_to_bottom,
                            ["M"]     = actions.move_to_middle,

                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,

                            ["?"]     = actions.which_key,
                        },
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,               -- false will only do exact matching
                        case_mode = "smart_case",
                        override_file_sorter = true, -- override the file sorter
                        override_generic_sorter = true, -- override the generic sorter
                    }
                },
            })

            telescope.load_extension("fzf")

            -- mappings
            local map = require("my-config.utils.mappings").map
            local mapping_options = { silent = true, noremap = true, nowait = true }

            map("n", "<Leader>ff", builtin.find_files, mapping_options, "Telescope Find files")
            map("n", "<Leader>fo", builtin.oldfiles, mapping_options, "Telescope Old files")
            map("n", "<Leader>fg", builtin.live_grep, mapping_options, "Telescope Grep files")
            map("n", "<Leader>fs", builtin.grep_string, mapping_options, "Telescope Grep string")
            map("n", "<Leader>fb", builtin.buffers, mapping_options, "Telescope List buffers")
            map("n", "<Leader>fd", builtin.diagnostics, mapping_options, "Telescope Workspace diagnostics")
            map("n", "<Leader>fh", builtin.help_tags, mapping_options, "Telescope Help tags")
            map("n", "<Leader>ft", builtin.treesitter, mapping_options, "Telescope Treesitter symbols")
            map("n", "<Leader>fR", builtin.reloader, mapping_options, "Telescope Module reloader")
            map("n", "<Leader>fB", builtin.builtin, mapping_options, "Telescope Builtins")
            map("n", "<Leader>fr", builtin.lsp_references, mapping_options, "Telescope Lsp references")
            map("n", "<Leader>fS", builtin.lsp_document_symbols, mapping_options, "Telescope Lsp document symbols")
            map("n", "<Leader>fw", builtin.lsp_workspace_symbols, mapping_options, "Telescope Lsp workspace symbols")
        end,
    }
}
