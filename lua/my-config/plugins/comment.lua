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
		})
	end,
}
