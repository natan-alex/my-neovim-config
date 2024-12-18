-- https://github.com/ojroques/nvim-lspfuzzy
return {
	"ojroques/nvim-lspfuzzy",
    enabled = false,
	dependencies = {
		{ "junegunn/fzf" },
		{ "junegunn/fzf.vim" }, -- to enable preview (optional)
	},
    keys = {
		{
			"<Leader>da",
			"<CMD>LspDiagnosticsAll<CR>",
			mode = "n",
			desc = "Lsp Fuzzy show all diagnostics",
		},
		{
			"<Leader>db",
			"<CMD>LspDiagnostics 0<CR>",
			mode = "n",
			desc = "Lsp Fuzzy show diagnostics for current buffer",
		},
    },
	config = function()
		require("lspfuzzy").setup({})
	end,
}
