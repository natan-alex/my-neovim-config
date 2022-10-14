local create_autogroup = vim.api.nvim_create_augroup
local create_autocommand = vim.api.nvim_create_autocmd

local group_options = { clear = true }

local indentation_group = create_autogroup("IndentationRelated", group_options)
local after_saving_group = create_autogroup("AfterSavingGroup", group_options)

create_autocommand("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "html" },
    group = indentation_group,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

create_autocommand("BufWritePre", {
    pattern = "*",
    group = after_saving_group,
    callback = function()
        pcall(vim.lsp.buf.format)
    end,
})
