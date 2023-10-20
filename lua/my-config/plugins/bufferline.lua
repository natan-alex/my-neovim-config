return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		-- Move to previous/next
		{ "<A-l>", "<CMD>BufferLineCycleNext<CR>", mode = "n", desc = "Bufferline go to next buffer" },
		{ "<A-h>", "<CMD>BufferLineCyclePrev<CR>", mode = "n", desc = "Bufferline go to previous buffer" },

		-- Re-order to previous/next
		{ "<A-L>", "<CMD>BufferLineMoveNext<CR>", mode = "n", desc = "Bufferline move buffer right" },
		{ "<A-H>", "<CMD>BufferLineMovePrev<CR>", mode = "n", desc = "Bufferline move buffer left" },

		-- Pin/unpin buffer
		{ "<A-P>", "<CMD>BufferLineTogglePin<CR>", mode = "n", desc = "Bufferline toggle pin current buffer" },

		-- Close buffers
		{ "<A-Left>", "<CMD>BufferLineCloseLeft<CR>", mode = "n", desc = "Bufferline close all buffers to the left" },
		{
			"<A-Right>",
			"<CMD>BufferLineCloseRight<CR>",
			mode = "n",
			desc = "Bufferline close all buffers to the right",
		},

		-- Pick a buffer
		{ "<A-b>", "<CMD>BufferLinePick<CR>", mode = "n", desc = "Bufferline pick a buffer" },
		{ "<A-B>", "<CMD>BufferLinePickClose<CR>", mode = "n", desc = "Bufferline close buffer pick" },

		-- Delete a buffer
		{ "<A-d>", "<CMD>bdelete<CR>", mode = "n", desc = "Delete buffer" },

		-- Sort buffers
		{ "<A-s><A-n>", "<CMD>BufferLineSortByTabs<CR>", mode = "n", desc = "Bufferline sort buffers by tabs" },
		{
			"<A-s><A-d>",
			"<CMD>BufferLineSortByDirectory<CR>",
			mode = "n",
			desc = "Bufferline sort buffers by directory",
		},
		{
			"<A-s><A-w>",
			"<CMD>BufferLineSortByRelativeDirectory<CR>",
			mode = "n",
			desc = "Bufferline sort buffers by relative directory",
		},
		{
			"<A-s><A-l>",
			"<CMD>BufferLineSortByExtension<CR>",
			mode = "n",
			desc = "Bufferline sort buffers by extension",
		},
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 25,
				max_prefix_length = 18, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 20,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, _, _, _)
					return "(" .. count .. ")"
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				persist_buffer_sort = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				hover = { enabled = false },
				sort_by = "id",
			},
		})
	end,
}
