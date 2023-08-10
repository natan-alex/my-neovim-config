local utils = require("my-config.utils.files")

-- Display a message when the current file is not in utf-8 format.
-- Note that we need to use `unsilent` command here because of this issue:
-- https://github.com/vim/vim/issues/4379
vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("non_utf8_file", { clear = true }),
    callback = function()
        if vim.bo.fileencoding ~= "utf-8" then
            vim.notify(
                "File not in UTF-8 format!",
                vim.log.levels.WARN,
                { title = "nvim-config" }
            )
        end
    end,
})

-- highlight yanked region, see `:h lua-highlight`
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank { timeout = 250 }
    end,
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
    callback = function(ctx)
        local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
        utils.create_dir_if_does_not_exist(dir)
    end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
vim.api.nvim_create_augroup("auto_read", { clear = true })

vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
    pattern = "*",
    group = "auto_read",
    callback = function()
        vim.notify(
            "File changed on disk. Buffer reloaded!",
            vim.log.levels.WARN,
            { title = "nvim-config" }
        )
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
    pattern = "*",
    group = "auto_read",
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

-- Resize all windows when we resize the terminal
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("win_autoresize", { clear = true }),
    desc = "autoresize windows on resizing operation",
    command = "wincmd =",
})