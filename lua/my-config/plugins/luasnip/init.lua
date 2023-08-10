local luasnip = require("luasnip")

luasnip.config.set_config({
    enable_autosnippets = true
})

vim.keymap.set({ "i", "s" }, "<A-j>", function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<A-k>", function() luasnip.jump(-1) end, { silent = true })

-- To use existing vs-code style snippets from a plugin
local paths = require("my-config.utils.paths")

local friendly_snippets_path = paths.join(vim.fn.stdpath("data"), "lazy", "friendly-snippets")

require("luasnip.loaders.from_vscode").lazy_load({ paths = friendly_snippets_path })

-- CUSTOM SNIPPETS
local modules = require("my-config.utils.modules")

local snippets_folder_path = paths.join(vim.g.plugins_folder_path, "luasnip", "snippets")

modules.load_modules_in_folder(snippets_folder_path)
