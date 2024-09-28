return {
	"RRethy/vim-illuminate",
    event = "VeryLazy",
	keys = {
		{
			"<Leader>it",
			"<CMD>IlluminateToggleBuf<CR>",
			mode = "n",
			desc = "Illuminate toggle",
		},
	},
	config = function()
		local illuminate = require("illuminate")

		illuminate.configure({
			-- providers: provider used to get references in the buffer, ordered by priority
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"alpha",
				"NvimTree",
				"packer",
				"lazy",
				"neogitstatus",
				"Trouble",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
				"DressingSelect",
				"TelescopePrompt",
			},
			-- delay: delay in milliseconds
			delay = 100,
			-- under_cursor: whether or not to illuminate under the cursor
			under_cursor = true,
		})
	end,
}
