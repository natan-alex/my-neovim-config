local paths = require("my-config.utils.paths")

local M = {}

local function load_module_from_file_path(path)
    -- Remove the lua folder path from the path to get just
    -- the module path starting at my-config path
    local without_lua_folder_path = string.gsub(path, vim.g.lua_folder_path, "")

    -- Remove path_separator on start of string
    if vim.startswith(without_lua_folder_path, paths.path_separator) then
        without_lua_folder_path = string.sub(without_lua_folder_path, 2)
    end

    local without_file_extension = string.gsub(without_lua_folder_path, "%.lua", "")

    -- Replace path_separator with dots to get the module
    local module = string.gsub(without_file_extension, paths.path_separator, ".")

    package.loaded[module] = nil
    require(module)
end

function M.load_modules_in_folder(folder_path)
    local files = vim.split(vim.fn.glob(folder_path .. paths.path_separator .. "*"), "\n")

    for _, file in pairs(files) do
        if vim.endswith(file, ".lua") then
            load_module_from_file_path(file)
        end
    end
end

return M
