require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
    },
})

vim.cmd("colorscheme catppuccin")
