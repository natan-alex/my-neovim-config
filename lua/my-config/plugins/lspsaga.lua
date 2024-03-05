return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "K", "<CMD>Lspsaga hover_doc<CR>", mode = "n", desc = "Lspsaga hover" },
		{ "gl", "<CMD>Lspsaga show_line_diagnostics<CR>", mode = "n", desc = "Lspsaga show line diagnostics" },
		-- { "gd", "<CMD>Lspsaga goto_definition<CR>", mode = "n", desc = "Lspsaga go to definition" },
		-- { "gD", "<CMD>Lspsaga peek_definition<CR>", mode = "n", desc = "Lspsaga peek definition" },
		-- { "gt", "<CMD>Lspsaga goto_type_definition<CR>", mode = "n", desc = "Lspsaga go to type definition" },
		-- { "gT", "<CMD>Lspsaga peek_type_definition<CR>", mode = "n", desc = "Lspsaga peek type definition" },
		-- { "gr", "<CMD>Lspsaga finder<CR>", mode = "n", desc = "Lspsaga open finder" },
		{
			"[d",
			"<CMD>Lspsaga diagnostic_jump_prev<CR>",
			mode = "n",
			desc = "Lspsaga go to previous diagnostic",
		},
		{ "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", mode = "n", desc = "Lspsaga go to next diagnostic" },
		{ "<Leader>rn", "<CMD>Lspsaga rename<CR>", mode = "n", desc = "Lspsaga rename" },
		{ "<Leader>ca", "<CMD>Lspsaga code_action<CR>", mode = "n", desc = "Lspsaga show code actions" },
		{ "<Leader>o", "<CMD>Lspsaga outline<CR>", mode = "n", desc = "Lspsaga open outline" },
	},
	config = function()
		require("lspsaga").setup({
			code_action = {
				extend_gitsigns = true,
			},
			definition = {
				keys = {
					edit = "o",
				},
			},
			finder = {
				keys = {
					quit = { "<C-c>", "<ESC>", "q" },
					toggle_or_open = { "o", "<CR>" },
				},
			},
			outline = {
				close_after_jump = true,
				keys = {
					quit = { "<C-c>", "<ESC>", "q" },
					toggle_or_jump = { "o", "<CR>" },
				},
			},
			rename = {
				in_select = false,
				keys = {
					quit = { "<C-c>", "<ESC>" },
				},
			},
			symbol_in_winbar = {
				enable = false,
			},
		})
	end,
}
