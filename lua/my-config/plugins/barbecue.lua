return {
	"utilyre/barbecue.nvim",
    event = "VeryLazy",
	dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
	config = function()
		require("barbecue").setup()
	end,
}
