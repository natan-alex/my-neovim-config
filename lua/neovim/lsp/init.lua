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

    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<Leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    map("n", "<Leader>qf", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
    map("n", "<Leader>F", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
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
