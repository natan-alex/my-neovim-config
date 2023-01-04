local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
    },
    mapping = {
        ["<C-p>"]     = cmp.mapping.select_prev_item(),
        ["<C-n>"]     = cmp.mapping.select_next_item(),
        ["<Up>"]      = cmp.mapping.scroll_docs(-1),
        ["<Down>"]    = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-e>"]     = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    },
}
