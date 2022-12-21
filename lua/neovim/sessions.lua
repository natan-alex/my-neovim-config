vim.o.sessionoptions="blank,buffers,curdir,folds,tabpages,localoptions,winsize,winpos"

local paths = require("neovim.utils.paths")

local sessions_folder_path = paths.join(vim.fn.stdpath("data"), "sessions")

if vim.fn.isdirectory(sessions_folder_path) ~= 1 then
    vim.fn.mkdir(sessions_folder_path)
end

local function generate_session_filename()
    local filename = vim.fn.getcwd():gsub("%W", "")

    return paths.join(sessions_folder_path, filename .. ".vim")
end

local sessions_augroup = vim.api.nvim_create_augroup("SessionRelatedGroup", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    group = sessions_augroup,
    callback = function()
        local filename = generate_session_filename()
        pcall(vim.cmd, "source " .. filename)
    end
})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    group = sessions_augroup,
    callback = function()
        local filename = generate_session_filename()
        pcall(vim.cmd, "mksession! " .. filename)
    end
})
