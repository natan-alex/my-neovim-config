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
	build = function()
		if vim.fn.executable("make") == 1 then
			vim.cmd("make install_jsregexp")
		else
			local message = "Make not installed, could not install jsregexp"
			vim.notify(message, vim.log.levels.WARN, {})
		end
	end,
	config = function()
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			enable_autosnippets = true,
		})

		local map = require("my-config.utils.mappings").map

        map("i", "<TAB>", function()
            return luasnip.jumpable(1) and "<CMD>lua require('luasnip').jump(1)<CR>" or "<TAB>"
        end, { silent = true, expr = true })

        map("s", "<TAB>", function()
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            end
        end, { silent = true })

        map({ "i", "s" }, "<S-TAB>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true })

		-- CUSTOM SNIPPETS
		local custom_snippets_path = paths.join(vim.fn.getcwd(), "custom-snippets")

		require("luasnip.loaders.from_lua").load({ paths = custom_snippets_path })
	end,
}
