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
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
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

    mason_lspconfig.setup()

    local capabilities = server_capabilities()

    mason_lspconfig.setup_handlers({
      -- default handler (optional)
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

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

      ["gopls"] = function()
        lspconfig["gopls"].setup({
          capabilities = capabilities,
        })
      end,

      ["html"] = function()
        lspconfig["html"].setup({
          capabilities = capabilities,
        })
      end,

      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
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

      ["zls"] = function()
        lspconfig["zls"].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
