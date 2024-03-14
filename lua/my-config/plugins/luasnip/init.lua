local paths = require("my-config.utils.paths")

return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			local path = paths.join(vim.fn.stdpath("data"), "lazy", "friendly-snippets")
			require("luasnip.loaders.from_vscode").lazy_load({ paths = path })
		end,
	},
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			enable_autosnippets = true,
		})

		local map = require("my-config.utils.mappings").map

        map({ "i", "s" }, "<C-l>", function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { silent = true })

        map({ "i", "s" }, "<C-h>", function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true })

		-- CUSTOM SNIPPETS
		local custom_snippets_path = paths.join(paths.script_path(), "custom-snippets")

		require("luasnip.loaders.from_lua").load({ paths = custom_snippets_path })
	end,
}
