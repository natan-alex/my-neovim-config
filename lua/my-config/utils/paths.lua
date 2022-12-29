local M = {}

M.path_separator = package.config:sub(1, 1)

function M.join(...)
    local args = {...}
    local result = nil

    for _, str in ipairs(args) do
        if result == nil then
            result = str
        else
            result = result .. M.path_separator .. str
        end
    end

    return result
end

return M
