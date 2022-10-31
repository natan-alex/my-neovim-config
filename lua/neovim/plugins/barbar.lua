local was_module_found, bufferline = pcall(require, "bufferline")

if not was_module_found then
    return
end

bufferline.setup({
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

    -- Show every buffer
    hide = { current = false, inactive = false, visible = false },

    -- Enable/disable icons
    -- if set to "numbers", will show buffer index in the tabline
    -- if set to "both", will show buffer index and icons in the tabline
    icons = true,

    -- Configure icons on the bufferline.
    icon_separator_active = " ▎",
    icon_separator_inactive = " ▎",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",

    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
})

local map = vim.keymap.set
local mapping_options = { noremap = true, silent = true }

map("n", "<A-h>", "<cmd>BufferPrevious<cr>", mapping_options)
map("n", "<A-l>", "<cmd>BufferNext<cr>", mapping_options)
map("n", "<A-H>", "<cmd>BufferMovePrevious<cr>", mapping_options)
map("n", "<A-L>", "<cmd>BufferMoveNext<cr>", mapping_options)
map("n", "<A-q>", "<cmd>BufferClose<cr>", mapping_options)
map("n", "<A-b>", "<cmd>BufferPick<cr>", mapping_options)
