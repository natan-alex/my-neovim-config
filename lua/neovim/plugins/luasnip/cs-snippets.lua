local luasnip = require("luasnip")
local create_snippet = luasnip.s
local format = require("luasnip.extras.fmt").fmt
local insert_node = luasnip.insert_node
-- local function_node = luasnip.function_node
-- local repeat_node = require("luasnip.extras").rep

luasnip.add_snippets("cs", {
    create_snippet("cws", format([[Console.WriteLine("{}");]], { insert_node(1) })),
    create_snippet(
        "controller", 
        format(
        [[
        using Microsoft.AspNetCore.Mvc;

        namespace {};

        public class {} : ControllerBase
        {{
            {}
        }}
        ]], 
        { insert_node(1), insert_node(2), insert_node(3) })
    ),
})
