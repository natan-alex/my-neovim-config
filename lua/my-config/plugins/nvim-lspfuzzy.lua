-- https://github.com/ojroques/nvim-lspfuzzy
return {
	"ojroques/nvim-lspfuzzy",
	dependencies = {
		{ "junegunn/fzf" },
		{ "junegunn/fzf.vim" }, -- to enable preview (optional)
	},
	config = function()
		require("lspfuzzy").setup({})
	end,
}
