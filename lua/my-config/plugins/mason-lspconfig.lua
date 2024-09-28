local function server_capabilities()
    local capabilities

    local module_loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

    if module_loaded then
        capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )
    else
        capabilities = vim.lsp.protocol.make_client_capabilities()
    end

    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
    }

    return capabilities
end

return {
    "williamboman/mason-lspconfig.nvim",
	event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lspconfig_util = require("lspconfig.util")

        mason_lspconfig.setup()

        local capabilities = server_capabilities()

        mason_lspconfig.setup_handlers({
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["tsserver"] = function()
                lspconfig["tsserver"].setup({
                    capabilities = capabilities,
                    root_dir = lspconfig_util.root_pattern(".git"),
                    on_attach = function(client, _)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,
                })
            end,

            ["quick_lint_js"] = function()
                lspconfig["quick_lint_js"].setup({
                    capabilities = capabilities,
                    filetypes = {
                        "html",
                        "javascript",
                        "typescript",
                        "javascriptreact",
                        "typescriptreact",
                        "svelte",
                        "vue",
                        "tsx",
                        "jsx",
                        "astro",
                    },
                })
            end,
        })
    end,
}
