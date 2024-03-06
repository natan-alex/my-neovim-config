local M = {}

local strings = require("my-config.utils.strings")

M.path_separator = package.config:sub(1, 1)

function M.join(...)
    local args = {...}
    local result = nil

    for _, str in ipairs(args) do
        if result == nil then
            result = str
        else
            if strings.endswith(result, M.path_separator) then
                result = result .. str
            else
                result = result .. M.path_separator .. str
            end
        end
    end

    return result
end

function M.script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

return M
