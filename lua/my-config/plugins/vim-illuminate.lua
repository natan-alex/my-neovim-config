return {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function()
        local illuminate = require("illuminate")

        illuminate.configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                "lsp",
                "treesitter",
                "regex"
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

        local map = require("my-config.utils.mappings").map
        local mapping_options = { noremap = true, silent = true }

        map("n", "<Leader>it", illuminate.toggle_buf, mapping_options, "Illuminate toggle")
    end
}
