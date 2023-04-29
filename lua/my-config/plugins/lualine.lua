local M = {}

function M.setup_with_theme(theme)
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = theme
        },
        sections = {
            lualine_c = {
                require("auto-session").current_session_name
            }
        }
    })
end

return M
