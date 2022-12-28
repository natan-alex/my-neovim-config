require("bufferline").setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator = {
            icon = "▎", -- this should be omitted if indicator style is not "icon"
            style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf)  -- buf contains:
            if buf.bufnr ~= nil then
                return buf.bufnr .. " - " .. buf.name
            else
                return buf.name
            end
        end,
        max_name_length = 25,
        max_prefix_length = 18, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 22,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, _, _, _)
            return "(" .. count .. ")"
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = false,
        separator_style = "slant",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = { enabled = false },
        sort_by = "id",
    }
}

-- mappings
local map = require("neovim.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", mapping_options, "Bufferline go to next buffer")
map("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", mapping_options, "Bufferline go to previous buffer")

-- Re-order to previous/next
map("n", "<A-L>", "<CMD>BufferLineMoveNext<CR>", mapping_options, "Bufferline move buffer right")
map("n", "<A-H>", "<CMD>BufferLineMovePrev<CR>", mapping_options, "Bufferline move buffer left")

-- Pin/unpin buffer
map("n", "<A-p>", "<CMD>BufferLineTogglePin<CR>", mapping_options, "Bufferline toggle pin current buffer")

-- Close buffers
map("n", "<A-Left>", "<CMD>BufferLineCloseLeft<CR>",    mapping_options, "Bufferline close all buffers to the left")
map("n", "<A-Right>", "<CMD>BufferLineCloseRight<CR>",  mapping_options, "Bufferline close all buffers to the right")

-- Pick a buffer
map("n", "<A-b>", "<CMD>BufferLinePick<CR>",      mapping_options, "Bufferline pick a buffer")
map("n", "<A-B>", "<CMD>BufferLinePickClose<CR>", mapping_options, "Bufferline close buffer pick")

-- Delete a buffer
map("n", "<A-d>", "<CMD>bdelete<CR>", mapping_options, "Delete buffer")

-- Sort buffers
map("n", "<A-s><A-n>", "<CMD>BufferLineSortByTabs<CR>",              mapping_options, "Bufferline sort buffers by tabs")
map("n", "<A-s><A-d>", "<CMD>BufferLineSortByDirectory<CR>",         mapping_options, "Bufferline sort buffers by directory")
map("n", "<A-s><A-w>", "<CMD>BufferLineSortByRelativeDirectory<CR>", mapping_options, "Bufferline sort buffers by relative directory")
map("n", "<A-s><A-l>", "<CMD>BufferLineSortByExtension<CR>",         mapping_options, "Bufferline sort buffers by extension")
