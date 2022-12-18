local create_autogroup = vim.api.nvim_create_augroup
local create_autocommand = vim.api.nvim_create_autocmd

local group_options = { clear = true }

local indentation_group = create_autogroup("IndentationRelated", group_options)

local packer_group = create_autogroup("Packer", group_options)

local highlight_group = create_autogroup("YankHighlight", group_options)

create_autocommand("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "html" },
    group = indentation_group,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Automatically source and re-compile packer whenever init.lua is changed
create_autocommand("BufWritePost", {
    command = "source <afile> | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC"),
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
create_autocommand("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
