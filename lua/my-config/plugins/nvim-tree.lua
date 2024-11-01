return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<Leader>e", "<CMD>NvimTreeToggle<CR>", desc = "NvimTree toggle" },
    },
    config = function()
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup({
            disable_netrw = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            hijack_unnamed_buffer_when_opening = true,

            update_focused_file = {
                enable = true,
            },

            view = {
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
                            enable = true,
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

                vim.keymap.del("n", "H", { buffer = buffer })
                vim.keymap.del("n", "L", { buffer = buffer })
                vim.keymap.del("n", "gy", { buffer = buffer })
                vim.keymap.del("n", "ge", { buffer = buffer })

                map("n", "?", api.tree.toggle_help, options, "NvimTree show help")
                map("n", "C", api.tree.change_root_to_node, options, "NvimTree change cwd")
                map("n", "<C-h>", api.tree.toggle_hidden_filter, options, "NvimTree toggle show dotfiles")
                map("n", "gp", api.fs.copy.absolute_path, options, "NvimTree copy absolute path")
                map("n", "gn", api.fs.copy.basename, options, "NvimTree copy basename")
                map("n", "ge", api.node.open.toggle_group_empty, options, "NvimTree toggle group empty")
            end,
        })
    end,
}
