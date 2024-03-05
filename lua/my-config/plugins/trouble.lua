return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "gr", "<CMD>Trouble lsp_references<CR>", mode = "n", desc = "Trouble show lsp references" },
		{ "gd", "<CMD>Trouble lsp_definitions<CR>", mode = "n", desc = "Trouble show lsp definitions" },
		{ "gi", "<CMD>Trouble lsp_implementations<CR>", mode = "n", desc = "Trouble show lsp implementations" },
		{ "gt", "<CMD>Trouble lsp_type_definitions<CR>", mode = "n", desc = "Trouble show lsp type definitions" },

		{ "<leader>xx", "<CMD>TroubleToggle<CR>", mode = "n", desc = "Trouble toggle" },
		{
			"<leader>xw",
			"<CMD>Trouble workspace_diagnostics<CR>",
			mode = "n",
			desc = "Trouble show workspace diagnostics",
		},
		{
			"<leader>xd",
			"<CMD>Trouble document_diagnostics<CR>",
			mode = "n",
			desc = "Trouble show document diagnostics",
		},
		{ "<leader>xq", "<CMD>Trouble quickfix<CR>", mode = "n", desc = "Trouble show quickfix list" },
		{ "<leader>xl", "<CMD>Trouble loclist<CR>", mode = "n", desc = "Trouble show loclist" },
	},
}
