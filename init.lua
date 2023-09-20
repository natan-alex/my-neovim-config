local paths = require("my-config.utils.paths")

local my_config_path = paths.join(vim.fn.stdpath("config"), "lua", "my-config")

local core_config_files = {
    "globals.lua", -- some global settings
    "settings.vim", -- setting options in nvim
    "mappings", -- all the user-defined mappings
    "plugins",    -- all the plugins installed and their configurations
    "autocommands", -- various autocommands
}

-- source all the core config files
for _, file_name in ipairs(core_config_files) do
    if vim.endswith(file_name, ".vim") then
        local path = paths.join(my_config_path, file_name)
        vim.cmd("source " .. path)
    else
        local file_name_without_extension = string.gsub(file_name, "%.lua", "")
        local module = "my-config." .. file_name_without_extension
        package.loaded[module] = nil
        require(module)
    end
end
