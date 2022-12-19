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
        local nmap = require("neovim.utils.mappings").nmap
        local mapping_options = { silent = true, noremap = true, }

        nmap("<Leader>hS", gitsigns.stage_buffer,              mapping_options, "Gitsigns stage buffer")
        nmap("<Leader>hu", gitsigns.undo_stage_hunk,           mapping_options, "Gitsigns undo stage hunk")
        nmap("<Leader>hR", gitsigns.reset_buffer,              mapping_options, "Gitsigns reset buffer")
        nmap("<Leader>hp", gitsigns.preview_hunk,              mapping_options, "Gitsigns preview hunk")
        nmap("<Leader>hd", gitsigns.diffthis,                  mapping_options, "Gitsigns diff this")
        nmap("<Leader>hD", gitsigns.toggle_deleted,            mapping_options, "Gitsigns toggle deleted")
        nmap("<Leader>hs", gitsigns.stage_hunk,                mapping_options, "Gitsigns stage hunk")
        nmap("<Leader>hr", gitsigns.reset_hunk,                mapping_options, "Gitsigns reset hunk")
        nmap("<Leader>hl", gitsigns.toggle_current_line_blame, mapping_options, "Gitsigns toggle current line blame")
        nmap(
            "]c",
            function()
                if vim.wo.diff then return "]c" end
                vim.schedule(function() gitsigns.next_hunk() end)
                return "<Ignore>"
            end,
            mapping_options,
            "Gitsigns go to next hunk"
        )
        nmap(
            "[c",
            function()
                if vim.wo.diff then return "[c" end
                vim.schedule(function() gitsigns.prev_hunk() end)
                return "<Ignore>"
            end,
            mapping_options,
            "Gitsigns go to previous hunk"
        )
    end
}
