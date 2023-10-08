return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VimEnter",
    config = function()
        local null_ls = require("null-ls")

        local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
        local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }

        null_ls.setup({
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
            sources = {
                null_ls.builtins.formatting.prettierd.with({
                    condition = function(utils)
                        return utils.root_has_file(prettier_root_files)
                    end
                }),
                null_ls.builtins.formatting.eslint_d.with({
                    condition = function(utils)
                        local has_eslint_file = utils.root_has_file(eslint_root_files)
                        local has_prettier_file = utils.root_has_file(prettier_root_files)
                        return has_eslint_file and not has_prettier_file
                    end
                }),
                null_ls.builtins.diagnostics.eslint_d.with({
                    condition = function(utils)
                        utils.root_has_file(eslint_root_files)
                    end
                }),
                null_ls.builtins.code_actions.eslint_d.with({
                    condition = function(utils)
                        utils.root_has_file(eslint_root_files)
                    end
                }),
            }
        })
    end,
}
