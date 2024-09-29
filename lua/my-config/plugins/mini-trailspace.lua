return {
	"echasnovski/mini.trailspace",
	version = "*",
	keys = {
		{
			"<Leader>mts",
			function()
				require("mini.trailspace").trim()
			end,
			mode = "n",
			desc = "Mini trailspace trim spaces",
		},
		{
			"<Leader>mtl",
			function()
				require("mini.trailspace").trim_last_lines()
			end,
			mode = "n",
			desc = "Mini trailspace trim empty lines",
		},
	},
	config = function()
		require("mini.trailspace").setup({})
	end,
}
