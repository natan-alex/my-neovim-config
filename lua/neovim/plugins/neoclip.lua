require("neoclip").setup()
require("telescope").load_extension("neoclip")

-- mapping
local mapping_options = {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {
    ["fn"] = { "<CMD>Telescope neoclip<CR>", "Neoclip telescope extension" },
}

require("which-key").register(mappings, mapping_options)
