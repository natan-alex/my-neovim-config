local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            entry_filter = function(entry, _)
                local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

                if kind == "Text" then
                    return false
                end

                return true
            end
        },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
    }),
    duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
    },
    duplicates_default = 0,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    mapping = {
        ["<C-p>"]     = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-k>"]     = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-n>"]     = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-j>"]     = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Up>"]      = cmp.mapping.scroll_docs(-1),
        ["<Down>"]    = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        ["<Tab>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-e>"]     = cmp.mapping.abort(),
    },
}
