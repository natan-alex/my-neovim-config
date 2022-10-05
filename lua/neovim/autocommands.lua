local create_autogroup = vim.api.nvim_create_augroup
local create_autocommand = vim.api.nvim_create_autocmd

local group_options = { clear = true }
local groups = {
    build_and_run_related = create_autogroup("BuildAndRunRelated", group_options),
    indentation_related = create_autogroup("IndentationRelated", group_options),
    terminal_related = create_autogroup("TerminalRelated", group_options),
}

local map = vim.keymap.set
local map_options = { noremap = true, silent = true }

local function term_exec(command)
    return function()
        local was_toggleterm_module_found, toggleterm = pcall(require, "toggleterm")
        if not was_toggleterm_module_found then return end
        local term = require("toggleterm.terminal").get(1)
        if term ~= nil then term:shutdown() end
        toggleterm.exec(command)
    end
end

create_autocommand("TermOpen", {
    pattern = "term://*",
    group = groups.terminal_related,
    callback = function()
        local buf_map = vim.api.nvim_buf_set_keymap
        buf_map(0, "t", "<ESC>", [[<C-\><C-n>]], map_options)
    end,
})

create_autocommand("FileType", {
    pattern = {"js", "ts", "css", "html"},
    group = groups.indentation_related,
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

create_autocommand("FileType", {
    pattern = "cs",
    group = groups.build_and_run_related,
    callback = function()
        map("n", "<Leader><Leader>r", term_exec("dotnet run"), map_options)
        map("n", "<Leader><Leader>w", term_exec("dotnet watch run"), map_options)
        map("n", "<Leader><Leader>b", term_exec("dotnet build"), map_options)
    end,
})

create_autocommand("FileType", {
    pattern = "rs",
    group = groups.build_and_run_related,
    callback = function()
        map("n", "<Leader><Leader>r", term_exec("cargo run"), map_options)
        map("n", "<Leader><Leader>w", term_exec("cargo watch -x run"), map_options)
        map("n", "<Leader><Leader>b", term_exec("cargo build"), map_options)
    end,
})

create_autocommand("FileType", {
    pattern = "c",
    group = groups.build_and_run_related,
    callback = function()
        local file = vim.fn.expand("<afile>")
        map("n", "<Leader><Leader>r", term_exec("./exe"), map_options)
        map("n", "<Leader><Leader>c", term_exec("gcc " .. file .. " -o exe"), map_options)
    end,
})
