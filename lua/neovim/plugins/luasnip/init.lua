local was_module_found, luasnip = pcall(require, "luasnip")

if not was_module_found then
    return
end

luasnip.config.set_config({
    enable_autosnippets = true,
})

local mapping_options = { noremap = true, silent = true }

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, mapping_options)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, mapping_options)

vim.keymap.set("i", "<C-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, mapping_options)


-- To use existing vs-code style snippets from a plugin
require("luasnip.loaders.from_vscode").lazy_load()


-- CUSTOM SNIPPETS

require("neovim.plugins.luasnip.cs-snippets")
require("neovim.plugins.luasnip.java-snippets")
require("neovim.plugins.luasnip.js-ts-snippets")
