local gitsigns = require("gitsigns")

gitsigns.setup {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    on_attach = function()
        local mapping_options = {
            mode = "n",
            prefix = nil,
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = false,
        }

        local mappings = {
            ["<Leader>h"] = {
                S = { gitsigns.stage_buffer, "Gitsigns stage buffer" },
                u = { gitsigns.undo_stage_hunk, "Gitsigns undo stage hunk" },
                R = { gitsigns.reset_buffer, "Gitsigns reset buffer" },
                p = { gitsigns.preview_hunk, "Gitsigns preview hunk" },
                l = { gitsigns.toggle_current_line_blame, "Gitsigns toggle current line blame" },
                d = { gitsigns.diffthis, "Gitsigns diff this" },
                D = { gitsigns.toggle_deleted, "Gitsigns toggle deleted" },
                s = { gitsigns.stage_hunk, "Gitsigns stage hunk" },
                r = { gitsigns.reset_hunk, "Gitsigns reset hunk" },
            },
            ["]c"] = {
                function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gitsigns.next_hunk() end)
                    return "<Ignore>"
                end,
                "Gitsigns go to next hunk"
            },
            ["[c"] = {
                function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gitsigns.prev_hunk() end)
                    return "<Ignore>"
                end,
                "Gitsigns go to previous hunk"
            },
        }

        require("which-key").register(mappings, mapping_options)
    end
}
