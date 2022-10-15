require("neovim.plugins.colorschemes.vscode")

local colorschemes = { "vscode", "onedark" }

for _, colorscheme in ipairs(colorschemes) do
    local could_apply_colorscheme = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if could_apply_colorscheme then
        print("colorscheme '" .. colorscheme .. "' applied")
        break
    end

    print("colorscheme '" .. colorscheme .. "' could not be applied. Trying another...")
end
