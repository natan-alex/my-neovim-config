return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-emoji" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "onsails/lspkind.nvim" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip",        build = "make" },
    },
    config = function()
        local lspkind = require("lspkind")
        lspkind.init({})

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "emoji" },
                { name = "treesitter" },
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({ border = "single" }),
                documentation = cmp.config.window.bordered({ border = "single" }),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-c>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.complete(),
                ["<C-p>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ["<C-n>"] = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({
                                behavior = cmp.SelectBehavior.Insert,
                            })
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),
            }),
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        -- insert `(` after select function or method item
        local module_found, cmp_autopairs = pcall(require("nvim-autopairs.completion.cmp"))

        if module_found then
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    end,
}
