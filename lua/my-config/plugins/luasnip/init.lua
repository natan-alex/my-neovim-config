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

		map({ "i", "s" }, "<C-l>", "<CMD>lua require('luasnip').jump(1)<CR>", { silent = true })
		map({ "i", "s" }, "<C-h>", "<CMD>lua require('luasnip').jump(-1)<CR>", { silent = true })

		-- CUSTOM SNIPPETS
		local custom_snippets_path = paths.join(paths.script_path(), "custom-snippets")

		require("luasnip.loaders.from_lua").load({ paths = custom_snippets_path })
	end,
}
