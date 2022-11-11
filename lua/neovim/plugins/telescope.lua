local was_module_found, telescope = pcall(require, "telescope")

if not was_module_found then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = "🔭  ",
        selection_caret = "»  ",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-c>"] = actions.close,

                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
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
        }
    },
    pickers = {
        find_files = {
            -- theme = "dropdown",
        }
    },
})

local telescope_builtin = require("telescope.builtin")
local map = vim.keymap.set
local mapping_options = { noremap = true }

map("n", "<Leader>ff", telescope_builtin.find_files, mapping_options)
map("n", "<Leader>fr", telescope_builtin.oldfiles, mapping_options)
map("n", "<Leader>fg", telescope_builtin.live_grep, mapping_options)
map("n", "<Leader>fb", telescope_builtin.buffers, mapping_options)
map("n", "<Leader>fd", telescope_builtin.diagnostics, mapping_options)
map("n", "<Leader>fh", telescope_builtin.help_tags, mapping_options)
map("n", "<Leader>fc", function()
    telescope_builtin.current_buffer_fuzzy_find({ sorting_strategy = "ascending" })
end, mapping_options)
map("n", "<Leader>gs", telescope_builtin.git_status, mapping_options)
map("n", "<Leader>gb", telescope_builtin.git_branches, mapping_options)
map("n", "<Leader>gc", telescope_builtin.git_commits, mapping_options)
