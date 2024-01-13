return {
	"akinsho/toggleterm.nvim",
	keys = {
		{
			"<Leader>t",
			"<CMD>ToggleTerm<CR>",
			mode = "t",
			desc = "ToggleTerm toggle",
		},
		{
			"<Leader>tf",
			"<CMD>ToggleTerm direction=float size=70<CR>",
			mode = "n",
			desc = "ToggleTerm open float terminal",
		},
		{
			"<Leader>th",
			"<CMD>ToggleTerm direction=horizontal size=15<CR>",
			mode = "n",
			desc = "ToggleTerm open horizontal terminal",
		},
		{
			"<Leader>tv",
			"<CMD>ToggleTerm direction=vertical size=55<CR>",
			mode = "n",
			desc = "ToggleTerm open vertical terminal",
		},
	},
	config = function()
		require("toggleterm").setup({
			size = 70,

			autochdir = true,
			hide_numbers = true,
			persist_size = true,
			close_on_exit = true,
			start_in_insert = true,
			insert_mappings = true,

			shell = vim.o.shell,

			direction = "float",
			float_opts = { border = "curved" },
		})
	end,
}
