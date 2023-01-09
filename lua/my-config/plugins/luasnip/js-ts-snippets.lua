local luasnip = require("luasnip")
local create_snippet = luasnip.s
local format = require("luasnip.extras.fmt").fmt
local insert_node = luasnip.insert_node
-- local function_node = luasnip.function_node
-- local repeat_node = require("luasnip.extras").rep

local snippets = {
    create_snippet("cl", format([[console.log("{}");]], { insert_node(1) })),
    create_snippet("log", format([[console.log("{}");]], { insert_node(1) })),
    create_snippet("ce", format([[console.error("{}");]], { insert_node(1) })),
}

luasnip.add_snippets("javascript", snippets)
luasnip.add_snippets("typescript", snippets)
luasnip.add_snippets("javascriptreact", snippets)
luasnip.add_snippets("typescriptreact", snippets)
luasnip.add_snippets("svelte", snippets)
