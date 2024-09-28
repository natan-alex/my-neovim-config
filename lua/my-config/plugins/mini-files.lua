return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<Leader>e",
			function()
				require("mini.files").open()
			end,
			mode = "n",
			desc = "Open Mini.Files",
		},
	},
	config = function()
		require("mini.files").setup({})
	end,
}
