require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 35,
    auto_close = true,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    auto_unfold_hover = true,
    wrap = true,
    keymaps = {
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "K",
        toggle_preview = "p",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
    },
})

local map = require("my-config.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

map("n", "<Leader>o", "<CMD>SymbolsOutline<CR>", mapping_options, "Symbols Outline toggle")
