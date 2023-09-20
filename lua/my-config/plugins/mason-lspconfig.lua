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
