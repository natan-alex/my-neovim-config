local was_lspconfig_module_found, lspconfig = pcall(require, "lspconfig")

if not was_lspconfig_module_found then
    return
end

local was_lsp_installer_module_found, lsp_installer = pcall(require, "nvim-lsp-installer")

if not was_lsp_installer_module_found then
    return
end

local was_cmp_nvim_lsp_module_found, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not was_cmp_nvim_lsp_module_found then
    return
end

local function on_lsp_attach(_, bufnr)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, buffer = bufnr }

    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<Leader>ll", vim.diagnostic.setloclist, opts)
    map("n", "<Leader>ql", vim.diagnostic.setqflist, opts)
    map("n", "<Leader>F", vim.lsp.buf.format, opts)
    map("n", "<Leader>td", "<CMD>Telescope diagnostics<CR>", opts)
end

lsp_installer.setup()

for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    lspconfig[server.name].setup({
        on_attach = on_lsp_attach,
        capabilities = capabilities
    })
end
