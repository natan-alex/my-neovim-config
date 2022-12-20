local paths = require("neovim.utils.paths")
local files = require("neovim.utils.files")

local theme_file_path = paths.join(vim.fn.stdpath("data"), "theme.txt")

local themes = {
    ONEDARK = "onedark",
    CATPPUCCIN = "catppuccin",
    TOKYONIGHT = "tokyonight"
}

local themes_and_corresponding_configs = {
    [themes.ONEDARK] = "neovim.plugins.themes.onedark",
    [themes.CATPPUCCIN] = "neovim.plugins.themes.catppuccin",
    [themes.TOKYONIGHT] = "neovim.plugins.themes.tokyonight",
}

local themes_and_their_flavours = {
    [themes.ONEDARK] = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
    [themes.CATPPUCCIN] = { "macchiato", "latte", "frappe", "mocha" },
    [themes.TOKYONIGHT] = { "storm", "moon", "night", "day" }
}

local function apply_theme(theme, flavour)
    local config = require(themes_and_corresponding_configs[theme])
    local lualine_config = require("neovim.plugins.lualine")

    config.apply_theme(flavour)
    lualine_config.setup_with_theme(theme)
end

local function load_theme_or_default(default_theme, default_flavour)
    local lines = files.get_file_lines(theme_file_path)

    local theme = default_theme
    local flavour = default_flavour

    if lines ~= nil and lines[1] ~= nil then
	local split = vim.split(lines[1], ";")

	if split ~= nil and split[1] ~= nil and split[2] ~= nil then
	    theme = split[1]
	    flavour = split[2]
	end
    end

    apply_theme(theme, flavour)
end

local function ask_for_new_theme()
    local theme_names = vim.tbl_values(themes)

    local new_theme

    vim.ui.select(theme_names, { prompt = "Theme: " }, function(choice)
	new_theme = choice
    end)

    return new_theme
end

local function ask_for_new_flavour(theme)
    local flavours = themes_and_their_flavours[theme]

    local new_flavour

    vim.ui.select(flavours, { prompt = "\nFlavour: " }, function(choice)
	new_flavour = choice
    end)

    return new_flavour
end

local function change_theme()
    local new_theme = ask_for_new_theme()

    if new_theme == nil then return end

    local new_flavour = ask_for_new_flavour(new_theme)

    if new_flavour == nil then return end

    apply_theme(new_theme, new_flavour)

    files.create_and_write_to_file(
	theme_file_path,
	new_theme .. ";" .. new_flavour
    )
end

vim.api.nvim_create_user_command("ChangeTheme", change_theme, { nargs = 0 })

load_theme_or_default(themes.ONEDARK, themes_and_their_flavours[themes.ONEDARK][1])
