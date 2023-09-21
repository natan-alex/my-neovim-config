local M = {}

function M.apply_theme(flavour)
    vim.g.sonokai_style = flavour
    vim.g.sonokai_better_performance = 1
    vim.cmd("colorscheme sonokai")
end

return M
