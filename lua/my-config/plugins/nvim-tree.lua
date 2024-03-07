return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<Leader>e", "<CMD>NvimTreeToggle<CR>", desc = "NvimTree toggle" },
    },
    config = function()
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup({
            disable_netrw = true,
            select_prompts = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            hijack_unnamed_buffer_when_opening = true,

            update_focused_file = {
                enable = true,
            },

            view = {
                cursorline = true,
                debounce_delay = 100,
                centralize_selection = true,

                width = {
                    min = "20%",
                    max = "60%",
                },
            },

            renderer = {
                highlight_git = "none",
                highlight_modified = "icon",
                highlight_clipboard = "name",
                highlight_diagnostics = "name",
                highlight_opened_files = "name",
                icons = {
                    web_devicons = {
                        folder = {
                            enable = true
                        },
                    },
                },
            },

            diagnostics = {
                enable = true,
                show_on_dirs = true,
                debounce_delay = 100,
            },

            modified = {
                enable = true,
            },

            filters = {
                git_ignored = false,
                dotfiles = true,
            },

            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },

            on_attach = function(buffer)
                local api = require("nvim-tree.api")

                local map = require("my-config.utils.mappings").map
                local options = { noremap = true, silent = true, nowait = true, buffer = buffer }

                api.config.mappings.default_on_attach(buffer)

                map("n", "?", api.tree.toggle_help, options, "NvimTree show help")
                map("n", "C", api.tree.change_root_to_node, options, "NvimTree change cwd")
            end,
        })
    end,
}
