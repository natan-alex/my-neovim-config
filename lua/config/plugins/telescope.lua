return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      after = { "nvim-telescope/telescope.nvim" },
      build = "make",
    },
  },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {
      desc = "Telescope find files"
    })

    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
      desc = "Telescope grep files"
    })

    vim.keymap.set("n", "<leader>fs", builtin.grep_string, {
      desc = "Telescope grep string in cursor",
    })

    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {
      desc = "Telescope Old files",
    })

    vim.keymap.set("n", "<leader>b", builtin.buffers, {
      desc = "Telescope list buffers",
    })

    vim.keymap.set("n", "<leader>fc", builtin.command_history, {
      desc = "Telescope show command history",
    })

    vim.keymap.set("n", "<leader>f/", builtin.search_history, {
      desc = "Telescope show search history",
    })

    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {
      desc = "Telescope workspace diagnostics",
    })

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
      desc = "Telescope help tags",
    })

    vim.keymap.set("n", "<leader>ft", builtin.treesitter, {
      desc = "Telescope treesitter symbols",
    })

    vim.keymap.set("n", "<leader>fR", builtin.reloader, {
      desc = "Telescope module reloader",
    })

    vim.keymap.set("n", "<leader>fB", builtin.builtin, {
      desc = "Telescope builtins",
    })

    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
      desc = "Telescope lsp references",
    })

    vim.keymap.set("n", "<leader>fS", builtin.lsp_document_symbols, {
      desc = "Telescope lsp document symbols",
    })

    vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {
      desc = "Telescope lsp workspace symbols",
    })

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local sorters = require("telescope.sorters")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔭  ",
        selection_caret = "»  ",
        path_display = { "truncate" },
        set_env = { ["COLORTERM"] = "truecolor" },

        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,

        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
          "--hidden",
          "--glob=!.git/",
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,

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
      pickers = {
        live_grep = {
          theme = "dropdown",
        },

        grep_string = {
          theme = "dropdown",
        },

        find_files = {
          theme = "dropdown",
          previewer = false,
        },

        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
            n = { ["dd"] = actions.delete_buffer },
          },
        },

        colorscheme = {
          enable_preview = true,
        },

        lsp_references = {
          theme = "dropdown",
          initial_mode = "normal",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          case_mode = "smart_case",
          override_file_sorter = true,
          override_generic_sorter = true,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
