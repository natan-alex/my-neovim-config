local M = {}

function M.apply_theme(flavour)
    require("catppuccin").setup({
        flavour = flavour, -- latte, frappe, macchiato, mocha
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
        },
    })

    vim.cmd("colorscheme catppuccin-" .. flavour)
end

return M
