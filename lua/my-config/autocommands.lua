-- Highlight yanked region, see `:h lua-highlight`
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
})

-- Check for file changes
vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
    pattern = "*",
    group = vim.api.nvim_create_augroup("auto_read", { clear = true }),
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

-- Handle large files
-- ref: https://vi.stackexchange.com/a/169/15292
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("large_file", { clear = true }),
    callback = function()
        local file = vim.fn.expand("<afile>")

        local large_file_size = 10485760 -- 10MB

        local file_size = vim.fn.getfsize(file)

        if file_size > large_file_size or file_size == -2 then
            vim.opt.eventignore:append("all")
            vim.opt.cursorline = false
            vim.opt.relativenumber = false
            vim.opt.swapfile = false
            vim.opt.undolevels = 5
            vim.opt.bufhidden = "unload"
        else
            vim.opt.eventignore:remove("all")
            vim.opt.relativenumber = true
        end
    end,
})
