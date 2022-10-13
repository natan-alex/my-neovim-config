local was_module_found, luasnip = pcall(require, "luasnip")

if not was_module_found then
    return
end

luasnip.config.set_config({
    enable_autosnippets = true,
})

local mapping_options = { noremap = true, silent = true }

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    end
end, mapping_options)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, mapping_options)
