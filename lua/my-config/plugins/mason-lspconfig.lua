local mason_lspconfig = require("mason-lspconfig")

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

mason_lspconfig.setup()

local lspconfig = require("lspconfig")

mason_lspconfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = lsp_capabilities,
        }
    end,
})


local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "K", vim.lsp.buf.hover, mapping_options, "Lsp hover")
map("n", "[d", vim.diagnostic.goto_prev, mapping_options, "Lsp go to previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, mapping_options, "Lsp go to next diagnostic")
map("n", "gD", vim.lsp.buf.declaration, mapping_options, "Lsp buffer declaration")
map("n", "gd", vim.lsp.buf.definition, mapping_options, "Lsp buffer definition")
map("n", "gi", vim.lsp.buf.implementation, mapping_options, "Lsp buffer implementation")
map("n", "gr", vim.lsp.buf.references, mapping_options, "Lsp buffer references")
map("n", "gt", vim.lsp.buf.type_definition, mapping_options, "Lsp buffer type definition")
map("n", "<C-I>", vim.lsp.buf.format, mapping_options, "Lsp format buffer")
map("n", "<C-k>", vim.lsp.buf.signature_help, mapping_options, "Lsp signature help")
map("n", "<Leader>rn", vim.lsp.buf.rename, mapping_options, "Lsp rename symbol")
map("n", "<Leader>ca", vim.lsp.buf.code_action, mapping_options, "Lsp code actions")
