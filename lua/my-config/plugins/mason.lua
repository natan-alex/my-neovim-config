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
	"williamboman/mason.nvim",
	cmd = "Mason",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    },
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lspconfig_util = require("lspconfig.util")

        mason_lspconfig.setup()

        local capabilities = server_capabilities()

        mason_lspconfig.setup_handlers({
            ["csharp_ls"] = function()
                lspconfig["csharp_ls"].setup({
                    capabilities = capabilities,
                })
            end,

            ["cssls"] = function()
                lspconfig["cssls"].setup({
                    capabilities = capabilities,
                })
            end,

            ["eslint"] = function()
                lspconfig["eslint"].setup({
                    capabilities = capabilities,
                    settings = {
                        format = false,
                    },
                    on_attach = function(client, _)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,
                })
            end,

            ["html"] = function()
                lspconfig["html"].setup({
                    capabilities = capabilities,
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

            ["rust_analyzer"] = function()
                lspconfig["rust_analyzer"].setup({
                    capabilities = capabilities,
                })
            end,

            ["ts_ls"] = function()
                lspconfig["ts_ls"].setup({
                    capabilities = capabilities,
                    on_attach = function(client, _)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,
                })
            end,

            ["vtsls"] = function()
                lspconfig["vtsls"].setup({
                    capabilities = capabilities,
                    on_attach = function(client, _)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,
                })
            end,
        })
	end,
}
