local paths = require("my-config.utils.paths")
local files = require("my-config.utils.files")

local theme_file_path = paths.join(vim.fn.stdpath("data"), "theme.txt")

local themes = {
    SONOKAI = "sonokai",
    ONEDARK = "onedark",
    MIDNIGHT = "midnight",
    CATPPUCCIN = "catppuccin",
    TOKYONIGHT = "tokyonight",
    VIM_CODE_DARK = "vim-code-dark",
}

local themes_and_corresponding_configs = {
    [themes.SONOKAI] = "my-config.plugins.themes.sonokai",
    [themes.ONEDARK] = "my-config.plugins.themes.onedark",
    [themes.MIDNIGHT] = "my-config.plugins.themes.midnight",
    [themes.CATPPUCCIN] = "my-config.plugins.themes.catppuccin",
    [themes.TOKYONIGHT] = "my-config.plugins.themes.tokyonight",
    [themes.VIM_CODE_DARK] = "my-config.plugins.themes.vim-code-dark",
}

local themes_and_their_flavours = {
    [themes.MIDNIGHT] = {},
    [themes.VIM_CODE_DARK] = {},
    [themes.TOKYONIGHT] = { "storm", "moon", "night", "day" },
    [themes.CATPPUCCIN] = { "macchiato", "latte", "frappe", "mocha" },
    [themes.ONEDARK] = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
    [themes.SONOKAI] = { "default", "atlantis", "andromeda", "shusia", "maia", "espresso" },
}

local theme_being_used = ""
local flavour_being_used = ""

local function apply_theme(theme, flavour)
    package.loaded["lualine"] = nil
    package.loaded["my-config.plugins.themes"] = nil
    package.loaded["my-config.plugins.lualine"] = nil

    local config = require(themes_and_corresponding_configs[theme])
    local lualine_config = require("my-config.plugins.lualine")

    config.apply_theme(flavour)
    lualine_config.setup_with_theme(theme)

    theme_being_used = theme
    flavour_being_used = flavour
end

local function join_theme_and_flavour(theme, flavour)
    return theme .. ";" .. flavour
end

local function split_theme_and_flavour(line)
    return vim.split(line, ";")
end

local function load_theme_or_default(default_theme, default_flavour)
    local lines = files.get_file_lines(theme_file_path)

    local theme = default_theme
    local flavour = default_flavour

    if lines ~= nil and lines[1] ~= nil then
        local split = split_theme_and_flavour(lines[1])

        if split ~= nil and split[1] ~= nil and split[2] ~= nil then
            theme = split[1]
            flavour = split[2] or ""
        end
    end

    apply_theme(theme, flavour)
end

local function ask_for_new_theme()
    local theme_names = vim.tbl_values(themes)

    local new_theme

    vim.ui.select(theme_names, { prompt = "New Theme: " }, function(choice)
        new_theme = choice
    end)

    return new_theme
end

local function ask_for_new_flavour(theme)
    local flavours = themes_and_their_flavours[theme]

    if #flavours == 0 then return end

    local new_flavour

    vim.ui.select(flavours, { prompt = "\nFlavour: " }, function(choice)
        new_flavour = choice
    end)

    return new_flavour
end

local function change_theme()
    print("Applied theme: " .. theme_being_used .. " | Flavour: " .. flavour_being_used)

    local new_theme = ask_for_new_theme()

    if new_theme == nil then return end

    local new_flavour = ask_for_new_flavour(new_theme)

    new_flavour = new_flavour or ""

    apply_theme(new_theme, new_flavour)

    files.create_and_write_to_file(
        theme_file_path,
        join_theme_and_flavour(new_theme, new_flavour)
    )
end

vim.api.nvim_create_user_command("ChangeTheme", change_theme, { nargs = 0 })

load_theme_or_default(themes.VSCODE, nil)
