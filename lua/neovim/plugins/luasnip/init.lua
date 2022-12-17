local luasnip = require("luasnip")

luasnip.config.set_config({
    enable_autosnippets = true,
})

local mapping_options = {
    mode = { "i", "s" },
    prefix = nil,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["<C-h>"] = {
        function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end,
        ""
    },
    ["<C-l>"] = {
        function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end,
        ""
    },
}

require("which-key").register(mappings, mapping_options)


-- To use existing vs-code style snippets from a plugin
require("luasnip.loaders.from_vscode").lazy_load()


-- CUSTOM SNIPPETS
require("neovim.plugins.luasnip.cs-snippets")
require("neovim.plugins.luasnip.java-snippets")
require("neovim.plugins.luasnip.js-ts-snippets")
