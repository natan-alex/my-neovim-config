local M = {}

function M.endswith(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

return M
