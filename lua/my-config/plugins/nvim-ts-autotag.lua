return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
