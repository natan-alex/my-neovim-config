local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.diagnostics.xo,
        null_ls.builtins.code_actions.xo,
    },
})