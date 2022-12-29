local M = {}

function M.get_file_lines(path)
    local file = io.open(path, "r")

    if not file then return end

    local lines = {}

    for line in file:lines() do
        table.insert(lines, line)
    end

    file:close()
    return lines
end

function M.create_and_write_to_file(path, ...)
    local lines = {...}
    local file = io.open(path, "w")

    if file == nil then return end

    for _, line in ipairs(lines) do
        file:write(line)
    end

    file:flush()

    file:close()
end

return M
