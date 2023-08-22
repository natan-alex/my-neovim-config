local M = {}

function M.setup_with_theme(theme)
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = theme
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { "diff" },
            lualine_x = { "filetype" },
            lualine_y = { "diagnostics" },
            lualine_z = { "location" },
        }
    })
end

return M
