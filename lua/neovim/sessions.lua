local sessions_dir = vim.fn.stdpath("data") .. "/sessions"
local session_file_name = "session.vim"
local path_separator = "__"

-- set the options for saving a session
vim.cmd("set sessionoptions=tabpages,folds,curdir,buffers")

-- create sessions dir if does not exist
if vim.fn.isdirectory(sessions_dir) == 0 then
    vim.fn.mkdir(sessions_dir)
end

-- the file name will be the current folder name 
-- with path_separator instead of / plus session_file_name
local function create_session_file_name() 
    local cwd = string.gsub(vim.fn.getcwd(), "%/", path_separator)
    local file_name = cwd .. path_separator .. session_file_name
    return sessions_dir .. "/" .. file_name
end

local function exists_file_at(file_path)
    local file = io.open(file_path, "r")

    if file == nil then
        return false
    else
        io.close(file)
        return true
    end
end

local function save_session()
    local file_path = create_session_file_name()
    vim.cmd("mksession! " .. file_path)
    print("Session saved to " .. file_path)
end

local function load_session()
    local file_path = create_session_file_name()

    if exists_file_at(file_path) then
        vim.cmd("source " .. file_path)
        print("Session loaded from " .. file_path)
    else 
        print("Session not found at " .. file_path)
    end
end

local function delete_session()
    local file_path = create_session_file_name()

    if exists_file_at(file_path) then
        vim.call("delete", file_path)
        print("Session at " .. file_path .. " was deleted")
    else
        print("No session to delete")
    end
end

vim.api.nvim_create_user_command("SaveSession", save_session, {})
vim.api.nvim_create_user_command("LoadSession", load_session, {})
vim.api.nvim_create_user_command("DeleteSession", delete_session, {})
