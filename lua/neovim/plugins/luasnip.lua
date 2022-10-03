local was_module_found, luasnip = pcall(require, "luasnip")

if not was_module_found then
    return
end

luasnip.config.set_config({
    enable_autosnippets = true,
})

local map = vim.keymap.set

map({ "i", "s" }, "<C-l>", function()
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    end
end, { noremap = true, silent = true })

map({ "i", "s" }, "<C-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { noremap = true, silent = true })
