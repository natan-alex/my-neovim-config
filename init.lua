local core_config_files = {
    "globals.lua", -- some global settings
    "settings.vim", -- setting options in nvim
    "mappings", -- all the user-defined mappings
    "plugins",    -- all the plugins installed and their configurations
    "autocommands", -- various autocommands
}

-- source all the core config files
for _, file_name in ipairs(core_config_files) do
    if vim.endswith(file_name, '.vim') then
        local path = string.format("%s/lua/my-config/%s", vim.fn.stdpath("config"), file_name)
        vim.cmd("source " .. path)
    else
        local module, _ = "my-config." .. string.gsub(file_name, "%.lua", "")
        package.loaded[module] = nil
        require(module)
    end
end
