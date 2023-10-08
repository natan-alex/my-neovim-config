return {
    { "hrsh7th/cmp-path",         after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp",     after = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ["<C-p>"]  = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                    ["<C-n>"]  = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<C-k>"]  = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                    ["<C-j>"]  = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<C-l>"]  = cmp.mapping(cmp.mapping.complete(), { "i" }),
                    ["<Up>"]   = cmp.mapping.scroll_docs(-1),
                    ["<Down>"] = cmp.mapping.scroll_docs(1),
                    ["<CR>"]   = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"]  = cmp.mapping.confirm({ select = true }),
                    ["<C-e>"]  = cmp.mapping.abort(),
                    ["<C-c>"]  = cmp.mapping.abort(),
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" },
                }, {
                    { name = "buffer" },
                })
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })
        end,
    }
}
