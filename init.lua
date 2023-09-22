local core_config_files = {
    "globals",      -- some global settings
    "settings",     -- setting options in nvim
    "mappings",     -- all the user-defined mappings
    "plugins",      -- all the plugins installed and their configurations
    "autocommands", -- various autocommands
}

-- source all the core config files
for _, file_name in ipairs(core_config_files) do
    local module = "my-config." .. file_name
    package.loaded[module] = nil
    require(module)
end
