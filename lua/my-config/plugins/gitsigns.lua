local files = require("my-config.utils.files")

return {
    "lewis6991/gitsigns.nvim",
    cond = files.inside_git_repo,
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(buffer)
                local map = require("my-config.utils.mappings").map
                local mapping_options = { silent = true, noremap = true, buffer = buffer }

                map("n", "<Leader>hS", gitsigns.stage_buffer, mapping_options, "Gitsigns stage buffer")
                map("n", "<Leader>hu", gitsigns.undo_stage_hunk, mapping_options, "Gitsigns undo stage hunk")
                map("n", "<Leader>hR", gitsigns.reset_buffer, mapping_options, "Gitsigns reset buffer")
                map("n", "<Leader>hp", gitsigns.preview_hunk, mapping_options, "Gitsigns preview hunk")
                map("n", "<Leader>hd", gitsigns.diffthis, mapping_options, "Gitsigns diff this")
                map("n", "<Leader>hD", gitsigns.toggle_deleted, mapping_options, "Gitsigns toggle deleted")
                map("n", "<Leader>hs", gitsigns.stage_hunk, mapping_options, "Gitsigns stage hunk")
                map("n", "<Leader>hr", gitsigns.reset_hunk, mapping_options, "Gitsigns reset hunk")
                map("n", "<Leader>hl", gitsigns.toggle_current_line_blame, mapping_options,
                    "Gitsigns toggle current line blame")
                map(
                    "n",
                    "]h",
                    function()
                        if vim.wo.diff then return "]h" end
                        vim.schedule(function() gitsigns.next_hunk() end)
                        return "<Ignore>"
                    end,
                    mapping_options,
                    "Gitsigns go to next hunk"
                )
                map(
                    "n",
                    "[h",
                    function()
                        if vim.wo.diff then return "[h" end
                        vim.schedule(function() gitsigns.prev_hunk() end)
                        return "<Ignore>"
                    end,
                    mapping_options,
                    "Gitsigns go to previous hunk"
                )
            end
        })
    end,
}
