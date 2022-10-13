local was_cmp_module_found, cmp = pcall(require, "cmp")

if not was_cmp_module_found then
    return
end

local was_luasnip_module_found, luasnip = pcall(require, "luasnip")

if not was_luasnip_module_found then
    return
end

local icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local vim_item_menu = {
    nvim_lsp = "[LSP]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
}

local function format_completion_menu_entry(entry, vim_item)
    vim_item.kind = string.format('%s', icons[vim_item.kind])
    vim_item.menu = vim_item_menu[entry.source.name]
    return vim_item
end

local function expand_snippets(args)
    luasnip.lsp_expand(args.body)
end

cmp.setup {
    snippet = { expand = expand_snippets },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = format_completion_menu_entry,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = true,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
    },
}
