return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    build = "make install_jsregexp",
    config = function()
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            enable_autosnippets = true
        })

        local map = require("my-config.utils.mappings").map

        map("i", "<TAB>", function()
            print("tab on insert")
            return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end, { silent = true, expr = true })

        map("s", "<TAB>", function() luasnip.jump(1) end, { silent = true})
        map("s", "<S-TAB>", function() luasnip.jump(-1) end, { silent = true})

        local paths = require("my-config.utils.paths")

        -- To use existing vs-code style snippets from a plugin
        local friendly_snippets_path = paths.join(vim.fn.stdpath("data"), "lazy", "friendly-snippets")

        require("luasnip.loaders.from_vscode").lazy_load({ paths = friendly_snippets_path })

        -- CUSTOM SNIPPETS
        local custom_snippets_path = paths.join(vim.fn.getcwd(), "custom-snippets")

        require("luasnip.loaders.from_lua").load({ paths = custom_snippets_path })
    end
}
