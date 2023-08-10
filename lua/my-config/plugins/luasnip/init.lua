local luasnip = require("luasnip")

luasnip.config.set_config({
    enable_autosnippets = true
})

vim.keymap.set({ "i", "s" }, "<A-j>", function() luasnip.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<A-k>", function() luasnip.jump(-1) end, { silent = true })

-- To use existing vs-code style snippets from a plugin
local paths = require("my-config.utils.paths")
local friendly_snippets_path = paths.join(vim.fn.stdpath("data"), "lazy", "friendly-snippets")

require("luasnip/loaders/from_vscode").lazy_load({ paths = friendly_snippets_path })


-- CUSTOM SNIPPETS
local snippets_module_prefix = "my-config.plugins.luasnip.snippets."
local my_config_path = paths.join(vim.fn.stdpath("config"), "lua", "my-config")
local snippets_folder_path = paths.join(my_config_path, "plugins", "luasnip", "snippets")
local files = vim.split(vim.fn.glob(snippets_folder_path .. paths.path_separator .. "*"), "\n")

for _, file in pairs(files) do
    local pieces = vim.split(file, paths.path_separator)
    local file_name = pieces[#pieces]

    if vim.endswith(file_name, ".lua") then
        local without_extension = string.gsub(file_name, "%.lua", "")
        local module, _ = snippets_module_prefix .. without_extension
        package.loaded[module] = nil
        require(module)
    end
end
