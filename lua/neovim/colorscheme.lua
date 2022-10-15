require("neovim.plugins.colorschemes.vscode")

local colorschemes = { "vscode", "onedark" }

for _, colorscheme in ipairs(colorschemes) do
    local could_apply_colorscheme = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if could_apply_colorscheme then
        break
    end
end
