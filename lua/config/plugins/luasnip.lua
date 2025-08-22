return {
  "L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      local path =
        vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "friendly-snippets")
      require("luasnip.loaders.from_vscode").lazy_load({ paths = path })
    end,
  },
  config = function()
    local luasnip = require("luasnip")

    luasnip.config.set_config({
      enable_autosnippets = true,
    })

    vim.keymap.set({ "i", "s" }, "<A-l>", function()
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      end
    end, {})

    vim.keymap.set({ "i", "s" }, "<A-h>", function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, {})
  end,
}
