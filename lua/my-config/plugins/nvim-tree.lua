return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<Leader>e", "<CMD>NvimTreeToggle<CR>", desc = "NvimTree toggle" },
	},
	config = function()
		local nvim_tree = require("nvim-tree")

		nvim_tree.setup({
			sort_by = "name",
			disable_netrw = true,
			hijack_cursor = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			modified = {
				enable = true,
				show_on_dirs = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			renderer = {
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = true,
			},
			on_attach = function(buffer)
				local api = require("nvim-tree.api")

				local map = require("my-config.utils.mappings").map
				local options = { noremap = true, silent = true, nowait = true, buffer = buffer }

				api.config.mappings.default_on_attach(buffer)

				map("n", "?", api.tree.toggle_help, options, "NvimTree show help")
				map("n", "C", api.tree.change_root_to_node, options, "NvimTree change cwd")
			end,
		})
	end,
}
