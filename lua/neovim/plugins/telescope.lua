local telescope_found, telescope = pcall(require, "telescope")

if not telescope_found then
    vim.notify("telescope module not found. Error: " .. telescope, "error")
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

-- mappings
local builtin = require("telescope.builtin")
local map = vim.keymap.set
local mapping_options = { noremap = true }

map("n", "<Leader>ff", builtin.find_files, mapping_options)
map("n", "<Leader>fo", builtin.oldfiles, mapping_options)
map("n", "<Leader>fg", builtin.live_grep, mapping_options)
map("n", "<Leader>fb", builtin.buffers, mapping_options)
map("n", "<Leader>fd", builtin.diagnostics, mapping_options)
map("n", "<Leader>fh", builtin.help_tags, mapping_options)
map("n", "<Leader>fq", builtin.quickfix, mapping_options)
