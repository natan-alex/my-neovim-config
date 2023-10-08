local luasnip = require("luasnip")
local create_snippet = luasnip.s
local format = require("luasnip.extras.fmt").fmt
local insert_node = luasnip.insert_node
-- local function_node = luasnip.function_node
-- local repeat_node = require("luasnip.extras").rep

luasnip.add_snippets("java", {
    create_snippet("sout", format([[System.out.println("{}");]], { insert_node(1) })),
})
