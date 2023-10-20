return {
	"ggandor/leap.nvim",
	event = "VeryLazy",
	keys = {
		{
			"sf",
			"<Plug>(leap-forward-to)",
			mode = { "n", "x" },
			desc = "Leap jump forward",
		},
		{
			"sb",
			"<Plug>(leap-backward-to)",
			mode = { "n", "x" },
			desc = "Leap jump backward",
		},
	},
}
