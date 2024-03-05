-- https://github.com/ojroques/nvim-lspfuzzy
return {
	"ojroques/nvim-lspfuzzy",
	dependencies = {
		{ "junegunn/fzf" },
		{ "junegunn/fzf.vim" }, -- to enable preview (optional)
	},
    keys = {
		{
			"<Leader>fz",
			"<CMD>LspDiagnosticsAll<CR>",
			mode = "n",
			desc = "Lsp Fuzzy show all diagnostics",
		},
		{
			"<Leader>f.",
			"<CMD>LspDiagnostics 0<CR>",
			mode = "n",
			desc = "Lsp Fuzzy show diagnostics for current buffer",
		},
    },
	config = function()
		require("lspfuzzy").setup({})
	end,
}
