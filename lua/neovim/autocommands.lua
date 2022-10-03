local create_autogroup = vim.api.nvim_create_augroup
local create_autocommand = vim.api.nvim_create_autocmd

local groups = {
    build_and_run_related = create_autogroup("BuildAndRunRelated", { clear = true }),
    indentation_related = create_autogroup("IndentationRelated", { clear = true }),
    terminal_related = create_autogroup("TerminalRelated", { clear = true }),
}

local map = vim.keymap.set
local map_options = { noremap = true, silent = true }

local function term_exec(command)
    return string.format(":TermExec cmd=\"%s\"<CR>", command)
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
        map("n", "<Leader><Leader>wr", term_exec("dotnet watch run"), map_options)
        map("n", "<Leader><Leader>b", term_exec("dotnet build"), map_options)
    end,
})

create_autocommand("FileType", {
    pattern = "rs",
    group = groups.build_and_run_related,
    callback = function()
        map("n", "<Leader><Leader>r", term_exec("cargo run"), map_options)
        map("n", "<Leader><Leader>wr", term_exec("cargo watch -x run"), map_options)
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
