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
    local lines = { ... }
    local file = io.open(path, "w")

    if file == nil then return end

    for _, line in ipairs(lines) do
        file:write(line)
    end

    file:flush()

    file:close()
end

function M.create_dir_if_does_not_exist(dir)
    local res = vim.fn.isdirectory(dir)

    if res == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

function M.executable(name)
    if vim.fn.executable(name) > 0 then
        return true
    end

    return false
end

function M.inside_git_repo()
    local res = vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.fn.match(res, 'true') == -1 then
        return false
    end

    return true
end

return M
