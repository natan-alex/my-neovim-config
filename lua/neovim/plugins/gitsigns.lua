local gitsigns_found, gitsigns = pcall(require, "gitsigns")

if not gitsigns_found then
    vim.notify("gitsigns module not found. Error: " .. gitsigns, "error")
    return
end

gitsigns.setup {
    on_attach = function()
        local map = vim.keymap.set

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gitsigns.next_hunk() end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return "<Ignore>"
        end, { expr = true })
    end
}

-- mappings
vim.keymap.set({"n", "v"}, "<Leader>hs", gitsigns.stage_hunk, { noremap = true })
vim.keymap.set({"n", "v"}, "<Leader>hr", gitsigns.reset_hunk, { noremap = true })
vim.keymap.set("n", "<Leader>hS", gitsigns.stage_buffer, { noremap = true })
vim.keymap.set("n", "<Leader>hu", gitsigns.undo_stage_hunk, { noremap = true })
vim.keymap.set("n", "<Leader>hR", gitsigns.reset_buffer, { noremap = true })
vim.keymap.set("n", "<Leader>hp", gitsigns.preview_hunk, { noremap = true })
vim.keymap.set("n", "<Leader>hl", gitsigns.toggle_current_line_blame, { noremap = true })
vim.keymap.set("n", "<Leader>hd", gitsigns.diffthis, { noremap = true })
vim.keymap.set("n", "<Leader>hD", gitsigns.toggle_deleted, { noremap = true })
