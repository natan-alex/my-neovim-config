local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_lsp_attach(_, buffer_number)
    local map = vim.keymap.set
    local mapping_options = { noremap = true, silent = true, buffer = buffer_number }

    -- map("n", "[d", vim.diagnostic.goto_prev, options)
    -- map("n", "]d", vim.diagnostic.goto_next, options)
    -- map("n", "K", vim.lsp.buf.hover, options)
    -- map("n", "<C-s>", vim.lsp.buf.signature_help, options)
    -- map("n", "gD", vim.lsp.buf.declaration, options)
    -- map("n", "gd", vim.lsp.buf.definition, options)
    -- map("n", "gi", vim.lsp.buf.implementation, options)
    -- map("n", "gr", vim.lsp.buf.references, options)
    -- map("n", "<Leader>rn", vim.lsp.buf.rename, options)
    -- map("n", "<Leader>ca", vim.lsp.buf.code_action, options)
    -- map("n", "<Leader>ll", vim.diagnostic.setloclist, options)
    -- map("n", "<Leader>ql", vim.diagnostic.setqflist, options)
    map("n", "<C-F>", vim.lsp.buf.format, mapping_options)
end

mason_lspconfig.setup()

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
