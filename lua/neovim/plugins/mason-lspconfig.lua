local mason_lspconfig = require("mason-lspconfig")

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

local function on_lsp_attach(_, buffer_number)
    local mapping_options = {
        mode = "n",
        prefix = nil,
        buffer = buffer_number,
        silent = true,
        noremap = true,
        nowait = false,
    }

    local mappings = {
        ["<Leader>g"] = {
            d = { vim.lsp.buf.definition, "Lsp buffer definition" },
            i = { vim.lsp.buf.implementation, "Lsp buffer implementation" },
            -- r = { vim.lsp.buf.references, "Lsp buffer references" },
            -- D = { vim.lsp.buf.declaration, "Lsp buffer declaration" },
        },
        ["<C-f>"] = { vim.lsp.buf.format, "Lsp format buffer" },
        -- K = { vim.lsp.buf.hover, "Lsp hover" },
        -- ["<C-s>"] = { vim.lsp.buf.signature_help, "Lsp signature help" },
        -- ["<Leader>"] = {
        --     ["rn"] = { vim.lsp.buf.rename, "Lsp rename symbol" },
        --     ["ca"] = { vim.lsp.buf.code_action, "Lsp code actions" },
        -- },
        -- ["[d"] = { vim.diagnostic.goto_prev, "Lsp go to previous diagnostic" },
        -- ["]d"] = { vim.diagnostic.goto_next, "Lsp go to next diagnostic" },
    }

    require("which-key").register(mappings, mapping_options)
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
