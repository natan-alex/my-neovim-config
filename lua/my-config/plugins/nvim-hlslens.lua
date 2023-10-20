return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "<Leader>hh", "<CMD>noh<CR>", mode = "n" },
		{ "*", [[*<CMD>lua require("hlslens").start()<CR>]], mode = "n" },
		{ "n", [[<CMD>execute("normal! " . v:count1 . "n")<CR><CMD>lua require("hlslens").start()<CR>]], mode = "n" },
		{ "N", [[<CMD>execute("normal! " . v:count1 . "N")<CR><CMD>lua require("hlslens").start()<CR>]], mode = "n" },
	},
	config = function()
		require("hlslens").setup()
	end,
}
