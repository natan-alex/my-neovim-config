local null_ls = require("null-ls")

local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }

local opts = {
    eslint_formatting = {
        condition = function(utils)
            local has_eslint_file = utils.root_has_file(eslint_root_files)
            local has_prettier_file = utils.root_has_file(prettier_root_files)
            return has_eslint_file and not has_prettier_file
        end,
    },
    eslint_diagnostics = {
        condition = function(utils)
            utils.root_has_file(eslint_root_files)
        end
    },
}

local function on_attach(client, _)
    if client.server_capabilities.document_formatting then
        vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
        vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
    end
end

null_ls.setup({
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d.with(opts.eslint_formatting),
        null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
        null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
    },
    on_attach = on_attach,
})
