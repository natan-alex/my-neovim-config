return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "gR", "<CMD>Trouble lsp_references<CR>", mode = "n", desc = "Trouble toggle lsp references" },
		{ "<leader>xx", "<CMD>TroubleToggle<CR>", mode = "n", desc = "Trouble toggle" },
		{
			"<leader>xw",
			"<CMD>Trouble workspace_diagnostics<CR>",
			mode = "n",
			desc = "Trouble toggle workspace diagnostics",
		},
		{
			"<leader>xd",
			"<CMD>Trouble document_diagnostics<CR>",
			mode = "n",
			desc = "Trouble toggle document diagnostics",
		},
		{ "<leader>xq", "<CMD>Trouble quickfix<CR>", mode = "n", desc = "Trouble toggle quickfix list" },
		{ "<leader>xl", "<CMD>Trouble loclist<CR>", mode = "n", desc = "Trouble toggle loclist" },
	},
}
