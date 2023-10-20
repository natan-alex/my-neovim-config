return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diff" },
				lualine_x = { "filetype" },
				lualine_y = { "diagnostics" },
				lualine_z = { "location" },
			},
		})
	end,
}
