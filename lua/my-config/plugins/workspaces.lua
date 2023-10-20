return {
	"natecraddock/workspaces.nvim",
	event = "VeryLazy",
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

		local map = require("my-config.utils.mappings").map
		local mapping_options = { noremap = true, silent = true, nowait = true }
	end,
}
