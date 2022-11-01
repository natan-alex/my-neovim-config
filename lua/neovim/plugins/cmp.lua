local was_cmp_module_found, cmp = pcall(require, "cmp")

if not was_cmp_module_found then
    return
end

local was_lspkind_module_found, lspkind = pcall(require, "lspkind")

if not was_lspkind_module_found then
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            local was_luasnip_module_found, luasnip = pcall(require, "luasnip")

            if not was_luasnip_module_found then
                return
            end

            luasnip.lsp_expand(args.body)
        end
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
        })
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
    },
    window = {
        documentation = true,
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-.>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
        }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
    },
}
