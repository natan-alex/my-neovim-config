local M = {}

function M.setup_with_theme(theme)
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = theme
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "filename", "location" },
            lualine_c = { "filetype" },
            lualine_x = { "diagnostics" },
            lualine_y = { "branch" },
            lualine_z = { "diff" },
        }
    })
end

return M
