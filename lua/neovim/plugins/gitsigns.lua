local gitsigns = require("gitsigns")

local map = vim.keymap.set

gitsigns.setup {
    on_attach = function()
        local mapping_options = { expr = true, noremap = true, silent = true }

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gitsigns.next_hunk() end)
            return "<Ignore>"
        end, mapping_options)

        map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return "<Ignore>"
        end, mapping_options)
    end
}

-- mappings
local mapping_options = { expr = true, noremap = true, silent = true }

map("n", "<Leader>hS", gitsigns.stage_buffer, mapping_options)
map("n", "<Leader>hu", gitsigns.undo_stage_hunk, mapping_options)
map("n", "<Leader>hR", gitsigns.reset_buffer, mapping_options)
map("n", "<Leader>hp", gitsigns.preview_hunk, mapping_options)
map("n", "<Leader>hl", gitsigns.toggle_current_line_blame, mapping_options)
map("n", "<Leader>hd", gitsigns.diffthis, mapping_options)
map("n", "<Leader>hD", gitsigns.toggle_deleted, mapping_options)
map({"n", "v"}, "<Leader>hs", gitsigns.stage_hunk, mapping_options)
map({"n", "v"}, "<Leader>hr", gitsigns.reset_hunk, mapping_options)
