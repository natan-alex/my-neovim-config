local M = {}

function M.create_dir_if_does_not_exist(dir)
    local res = vim.fn.isdirectory(dir)

    if res == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

function M.inside_git_repo()
    local res = vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.fn.match(res, 'true') == -1 then
        return false
    end

    return true
end

return M
