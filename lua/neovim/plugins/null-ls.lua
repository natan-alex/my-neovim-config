local null_ls_found, null_ls = pcall(require, "null-ls")

if not null_ls_found then
    vim.notify("null-ls module not found. Error: " .. null_ls, "error")
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.xo,
    },
})
