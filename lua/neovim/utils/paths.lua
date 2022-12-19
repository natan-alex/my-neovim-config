local M = {}

M.path_separator = "/"

if vim.fn.has("Windows") == 1 then
    M.path_separator = "\\"
end

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
