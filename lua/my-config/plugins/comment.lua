return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			---Add a space b/w comment and the line
			padding = true,

			---Whether the cursor should stay at its position
			sticky = true,

			---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
			---NOTE: If `mappings = false` then the plugin won"t create any mappings
			mappings = {
				---Operator-pending mapping
				---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
				---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
				basic = true,
				---Extra mapping
				---Includes `gco`, `gcO`, `gcA`
				extra = true,
				---Extended mapping
				---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
				extended = false,
			},
			toggler = {
				---Line-comment toggle keymap
				line = "<Leader>cc",
				---Block-comment toggle keymap
				block = "<Leader>cb",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<Leader>c",
				---Block-comment keymap
				block = "<Leader>b",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "<Leader>cO",
				---Add comment on the line below
				below = "<Leader>co",
				---Add comment at the end of line
				eol = "<Leader>cA",
			},
		})
	end,
}
