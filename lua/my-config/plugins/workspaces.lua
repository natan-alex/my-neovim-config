return {
	"natecraddock/workspaces.nvim",
	keys = {
		{
			"<Leader>ww",
			"<CMD>Telescope workspaces<CR>",
			mode = "n",
			desc = "Telescope workspaces",
		},
	},
	config = function()
		require("workspaces").setup({
			hooks = {
				open = function()
					vim.cmd("SessionRestore")
				end,
			},
		})

		require("telescope").load_extension("workspaces")
	end,
}
