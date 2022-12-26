-- Set barbar"s options
require("bufferline").setup {
    -- Enable/disable animations
    animation = false,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = false,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,

    -- Enable/disable close button
    closable = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,

    -- Enables / disables diagnostic symbols
    diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true },
        [vim.diagnostic.severity.WARN] = { enabled = false },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = true },
    },

    -- Enable/disable icons
    -- if set to "numbers", will show buffer index in the tabline
    -- if set to "both", will show buffer index and icons in the tabline
    icons = "both",

    icon_separator_active = "▎",
    icon_separator_inactive = "▎",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",
}


-- mappings
local map = require("neovim.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-l>", "<CMD>BufferNext<CR>",     mapping_options, "Barbar go to next buffer")
map("n", "<A-h>", "<CMD>BufferPrevious<CR>", mapping_options, "Barbar go to previous buffer")

-- Re-order to previous/next
map("n", "<A-L>", "<CMD>BufferMoveNext<CR>",     mapping_options, "Barbar move buffer right")
map("n", "<A-H>", "<CMD>BufferMovePrevious<CR>", mapping_options, "Barbar move buffer left")

-- Goto buffer in position...
map("n", "<A-0>", "<CMD>BufferLast<CR>",   mapping_options, "Barbar go to last buffer")
map("n", "<A-1>", "<CMD>BufferGoto 1<CR>", mapping_options, "Barbar go to buffer 1")
map("n", "<A-2>", "<CMD>BufferGoto 2<CR>", mapping_options, "Barbar go to buffer 2")
map("n", "<A-3>", "<CMD>BufferGoto 3<CR>", mapping_options, "Barbar go to buffer 3")
map("n", "<A-4>", "<CMD>BufferGoto 4<CR>", mapping_options, "Barbar go to buffer 4")
map("n", "<A-5>", "<CMD>BufferGoto 5<CR>", mapping_options, "Barbar go to buffer 5")
map("n", "<A-6>", "<CMD>BufferGoto 6<CR>", mapping_options, "Barbar go to buffer 6")
map("n", "<A-7>", "<CMD>BufferGoto 7<CR>", mapping_options, "Barbar go to buffer 7")
map("n", "<A-8>", "<CMD>BufferGoto 8<CR>", mapping_options, "Barbar go to buffer 8")
map("n", "<A-9>", "<CMD>BufferGoto 9<CR>", mapping_options, "Barbar go to buffer 9")

-- Pin/unpin buffer
map("n", "<A-p>", "<CMD>BufferPin<CR>", mapping_options, "Barbar pin current buffer")

-- Close buffer
map("n", "<A-d>", "<CMD>BufferClose<CR>", mapping_options, "Barbar close current buffer")

map("n", "<A-Left>", "<CMD>BufferCloseBuffersLeft<CR>",        mapping_options, "Barbar close all buffers to the left")
map("n", "<A-Right>", "<CMD>BufferCloseBuffersRight<CR>",      mapping_options, "Barbar close all buffers to the right")
map("n", "<A-C>", "<CMD>BufferCloseAllButCurrent<CR>",         mapping_options, "Barbar close all buffers but current")
map("n", "<A-P>", "<CMD>BufferCloseAllButPinned<CR>",          mapping_options, "Barbar close all buffers but pinned")
map("n", "<A-B>", "<CMD>BufferCloseAllButCurrentOrPinned<CR>", mapping_options, "Barbar close all buffers but pinned and current")

-- Magic buffer-picking mode
map("n", "<A-b>", "<CMD>BufferPick<CR>", mapping_options, "Barbar pick a buffer")

-- Sort automatically by...
map("n", "<A-s><A-n>", "<CMD>BufferOrderByBufferNumber<CR>", mapping_options, "Barbar sort buffers by number")
map("n", "<A-s><A-d>", "<CMD>BufferOrderByDirectory<CR>",    mapping_options, "Barbar sort buffers by directory")
map("n", "<A-s><A-l>", "<CMD>BufferOrderByLanguage<CR>",     mapping_options, "Barbar sort buffers by language")
map("n", "<A-s><A-w>", "<CMD>BufferOrderByWindowNumber<CR>", mapping_options, "Barbar sort buffers by window number")
