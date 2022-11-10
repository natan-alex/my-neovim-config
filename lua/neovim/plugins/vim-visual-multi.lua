local leader = ";"

vim.g.VM_default_mappings = 0
vim.g.VM_mouse_mappings = 1
vim.g.VM_theme = "iceblue"

vim.g.VM_maps = {
    ["Find Under"]           = "<C-n>",
    ["Find Subword Under"]   = "<C-n>",
    ["Add Cursor Down"]      = "<C-Down>",
    ["Add Cursor Up"]        = "<C-Up>",
    ["Switch Mode"]          = "<Tab>",
    ["Find Prev"]            = "[",
    ["Find Next"]            = "]",
    ["Goto Next"]            = "}",
    ["Goto Prev"]            = "{",
    ["Seek Next"]            = "<C-f>",
    ["Seek Prev"]            = "<C-b>",
    ["Skip Region"]          = "q",
    ["Remove Region"]        = "Q",
    ["Invert Direction"]     = "o",
    ["Find Operator"]        = "m",
    ["Surround"]             = "S",
    ["Replace Pattern"]      = "R",

    ["Add Cursor At Pos"]    = leader .. "\\",
    ["Align Char"]           = leader .. "<",
    ["Align Regex"]          = leader .. ">",
    ["Align"]                = leader .. "a",
    ["Case Conversion Menu"] = leader .. "C",
    ["Case Setting"]         = leader .. "E",
    ["Duplicate"]            = leader .. "d",
    ["Enlarge"]              = leader .. "+",
    ["Merge Regions"]        = leader .. "m",
    ["Numbers Append"]       = leader .. "N",
    ["Numbers"]              = leader .. "n",
    ["Remove Last Region"]   = leader .. "q",
    ["Rewrite Last Search"]  = leader .. "r",
    ["Run Ex"]               = leader .. "x",
    ["Run Last Ex"]          = leader .. "X",
    ["Run Last Normal"]      = leader .. "Z",
    ["Run Last Visual"]      = leader .. "V",
    ["Run Macro"]            = leader .. "@",
    ["Run Normal"]           = leader .. "z",
    ["Run Visual"]           = leader .. "v",
    ["Search Menu"]          = leader .. "S",
    ["Select All"]           = leader .. "A",
    ["Show Registers"]       = leader .. "R",
    ["Shrink"]               = leader .. "-",
    ["Split Regions"]        = leader .. "s",
    ["Start Regex Search"]   = leader .. "/",
    ["Toggle Block"]         = leader .. "<BS>",
    ["Toggle Multiline"]     = leader .. "M",
    ["Toggle Single Region"] = leader .. "<CR>",
    ["Toggle Whole Word"]    = leader .. "w",
    ["Tools Menu"]           = leader .. "T",
    ["Transpose"]            = leader .. "t",
    ["Visual Add"]           = leader .. "a",
    ["Visual All"]           = leader .. "e",
    ["Visual Cursors"]       = leader .. "c",
    ["Visual Find"]          = leader .. "f",
    ["Visual Regex"]         = leader .. "r",
    ["Visual Subtract"]      = leader .. "s",
    ["Zero Numbers Append"]  = leader .. "0N",
    ["Zero Numbers"]         = leader .. "0n",
}

-- Mouse mappings
vim.keymap.set("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
vim.keymap.set("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)  ")
vim.keymap.set("n", "<M-C-RightMouse>", "<Plug>(VM-Mouse-Column)")
