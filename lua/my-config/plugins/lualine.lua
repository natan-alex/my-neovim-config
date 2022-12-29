local M = {}

function M.setup_with_theme(theme)
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = theme
        }
    })
end

return M
