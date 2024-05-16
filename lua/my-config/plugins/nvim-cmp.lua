return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
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
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
				["<Up>"] = cmp.mapping.scroll_docs(-1),
				["<Down>"] = cmp.mapping.scroll_docs(1),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-c>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm(),
				["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})
	end,
}
