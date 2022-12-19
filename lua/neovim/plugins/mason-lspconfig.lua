local mason_lspconfig = require("mason-lspconfig")

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

local function on_lsp_attach(_, buffer_number)
    local nmap = require("neovim.utils.mappings").nmap
    local mapping_options = { silent = true, noremap = true, buffer = buffer_number }

    nmap("<Leader>gd",    vim.lsp.buf.definition,     mapping_options, "Lsp buffer definition")
    nmap("<Leader>gi",    vim.lsp.buf.implementation, mapping_options, "Lsp buffer implementation")
    -- nmap("<Leader>gr", vim.lsp.buf.references,     mapping_options, "Lsp buffer references")
    -- nmap("<Leader>gD", vim.lsp.buf.declaration,    mapping_options, "Lsp buffer declaration")
    nmap("<C-I>",         vim.lsp.buf.format,         mapping_options, "Lsp format buffer")
    -- nmap("K",          vim.lsp.buf.hover,          mapping_options, "Lsp hover")
    -- nmap("<C-s>",      vim.lsp.buf.signature_help, mapping_options, "Lsp signature help")
    -- nmap("<Leader>rn", vim.lsp.buf.rename,         mapping_options, "Lsp rename symbol")
    -- nmap("<Leader>ca", vim.lsp.buf.code_action,    mapping_options, "Lsp code actions")
    -- nmap("[d",         vim.diagnostic.goto_prev,   mapping_options, "Lsp go to previous diagnostic")
    -- nmap("]d",         vim.diagnostic.goto_next,   mapping_options, "Lsp go to next diagnostic")
end

mason_lspconfig.setup()

local lspconfig = require("lspconfig")

mason_lspconfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = on_lsp_attach,
            capabilities = lsp_capabilities,
        }
    end,
})
