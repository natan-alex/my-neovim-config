vim.diagnostic.config({
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_config", { clear = true }),
	callback = function(args)
		local map = require("my-config.utils.mappings").map
		local options = { silent = true, noremap = true, buffer = args.buf }

		local function format_buffer()
			vim.lsp.buf.format({ async = true, timeout = 4000 })
		end

		-- map("n", "K", vim.lsp.buf.hover, options, "Lsp hover")
		-- map("n", "gD", vim.lsp.buf.declaration, options, "Lsp go to declaration")
		-- map("n", "gd", vim.lsp.buf.definition, options, "Lsp go to definition")
		-- map("n", "gi", vim.lsp.buf.implementation, options, "Lsp go to implementation")
		-- map("n", "gr", vim.lsp.buf.references, options, "Lsp find references")
		-- map("n", "gl", vim.diagnostic.open_float, options, "Lsp show current diagnostics")
		-- map("n", "gt", vim.lsp.buf.type_definition, options, "Lsp go to type definition")
		-- map("n", "<Leader>rn", vim.lsp.buf.rename, options, "Lsp rename")
		-- map("n", "<Leader>ca", vim.lsp.buf.code_action, options, "Lsp show code actions")
		-- map("n", "<Leader>dq", vim.diagnostic.setloclist, options, "Lsp open loclist")
		map("n", "<C-I>", format_buffer, options, "Lsp format buffer")
		map({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, options, "Lsp show signature help")
		-- map("n", "[d", vim.diagnostic.goto_prev, options, "Lsp go to previous diagnostic")
		-- map("n", "]d", vim.diagnostic.goto_next, options, "Lsp go to next diagnostic")
	end,
})
