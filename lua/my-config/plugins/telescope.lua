return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	after = "nvim-telescope/telescope-fzf-native.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = function()
				if vim.fn.executable("make") == 1 then
					vim.cmd("make")
				else
					local message = "Make not installed, could not build telescope fzf native"
					vim.notify(message, vim.log.levels.WARN, {})
				end
			end,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	keys = {
		{ "<Leader>ff", "<CMD>Telescope find_files<CR>", "Telescope Find files", mode = "n" },
		{ "<Leader>fo", "<CMD>Telescope oldfiles<CR>", "Telescope Old files", mode = "n" },
		{ "<Leader>fg", "<CMD>Telescope live_grep<CR>", "Telescope Grep files", mode = "n" },
		{ "<Leader>fs", "<CMD>Telescope grep_string<CR>", "Telescope Grep string", mode = "n" },
		{ "<Leader>fb", "<CMD>Telescope buffers<CR>", "Telescope List buffers", mode = "n" },
		{ "<Leader>fd", "<CMD>Telescope diagnostics<CR>", "Telescope Workspace diagnostics", mode = "n" },
		{ "<Leader>fh", "<CMD>Telescope help_tags<CR>", "Telescope Help tags", mode = "n" },
		{ "<Leader>ft", "<CMD>Telescope treesitter<CR>", "Telescope Treesitter symbols", mode = "n" },
		{ "<Leader>fR", "<CMD>Telescope reloader<CR>", "Telescope Module reloader", mode = "n" },
		{ "<Leader>fB", "<CMD>Telescope builtin<CR>", "Telescope Builtins", mode = "n" },
		{ "<Leader>fr", "<CMD>Telescope lsp_references<CR>", "Telescope Lsp references", mode = "n" },
		{ "<Leader>fS", "<CMD>Telescope lsp_document_symbols<CR>", "Telescope Lsp document symbols", mode = "n" },
		{ "<Leader>fw", "<CMD>Telescope lsp_workspace_symbols<CR>", "Telescope Lsp workspace symbols", mode = "n" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = "🔭  ",
				selection_caret = "»  ",
				layout_strategy = "vertical",
				sorting_strategy = "ascending",
				path_display = { "truncate " },
				layout_config = {
					width = 0.8,
					height = 0.95,
					prompt_position = "top",
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.move_selection_next,
						["<C-j>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<C-k>"] = actions.move_selection_previous,

						["<Up>"] = actions.cycle_history_prev,
						["<Down>"] = actions.cycle_history_next,

						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<ESC>"] = actions.close,
						["<C-c>"] = actions.close,
						["<C-u>"] = false,
					},
					n = {
						["q"] = actions.close,
						["<ESC>"] = actions.close,
						["<C-c>"] = actions.close,

						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["M"] = actions.move_to_middle,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					case_mode = "smart_case",
					override_file_sorter = true, -- override the file sorter
					override_generic_sorter = true, -- override the generic sorter
				},
			},
		})
	end,
}
