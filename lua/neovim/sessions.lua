local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"
local session_file_name = "session.vim"
local path_separator = "__"

-- set the options for saving a session
vim.cmd("set sessionoptions=tabpages,folds,curdir,buffers")

-- create sessions dir if does not exist
if vim.fn.isdirectory(sessions_dir) == 0 then
    vim.fn.mkdir(sessions_dir)
end

local function get_session_file_path() 
    local dir = string.gsub(vim.fn.getcwd(), "%/", path_separator)
    return sessions_dir .. dir .. path_separator .. session_file_name
end

local function save_session(args)
    local file_path = get_session_file_path()
    vim.cmd("mksession! " .. file_path)
    print("Session saved to " .. file_path)
end

local function load_session()
    local file_path = get_session_file_path()
    vim.cmd("source " .. file_path)
    print("Session loaded from " .. file_path)
end

vim.api.nvim_create_user_command("SaveSession", save_session, {})
vim.api.nvim_create_user_command("LoadSession", load_session, {})
