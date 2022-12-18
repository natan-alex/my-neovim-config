vim.o.sessionoptions="blank,buffers,curdir,folds,tabpages,localoptions"

local replacements = {
    ["%s+"] = "_space_",
    ["\\"] = "_sep_",
    ["/"] = "_sep_",
}

local Path = require("plenary.path")

local sessions_folder_path = Path:new(vim.fn.stdpath("data"), "sessions"):absolute()

local function generate_session_filename()
    local filename = vim.fn.getcwd()

    for replace, by in pairs(replacements) do
        filename = filename:gsub(replace, by)
    end

    return Path:new(sessions_folder_path, filename .. ".vim"):absolute()
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
