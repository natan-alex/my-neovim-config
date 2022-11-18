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