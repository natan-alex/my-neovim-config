local cmp_found, cmp = pcall(require, "cmp")

if not cmp_found then
    vim.notify("cmp module not found. Error: " .. cmp, "error")
end

cmp.setup {
    snippet = {
        expand = function(args)
            local luasnip_found, luasnip = pcall(require, "luasnip")

            if luasnip_found then
                luasnip.lsp_expand(args.body)
            end
        end
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
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
        }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
    },
}
