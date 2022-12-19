local luasnip = require("luasnip")

luasnip.config.set_config({
    enable_autosnippets = true,
})

local map = require("neovim.utils.mappings").map
local mapping_options = { silent = true, noremap = true, }

map({ "i", "s" }, "<C-h>",
    function()
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        end
    end,
    mapping_options,
    ""
)
map({ "i", "s" }, "<C-l>",
    function()
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif luasnip.choice_active() then
            luasnip.change_choice(1)
        end
    end,
    mapping_options,
    ""
)

-- To use existing vs-code style snippets from a plugin
require("luasnip.loaders.from_vscode").lazy_load()


-- CUSTOM SNIPPETS
require("neovim.plugins.luasnip.cs-snippets")
require("neovim.plugins.luasnip.java-snippets")
require("neovim.plugins.luasnip.js-ts-snippets")
