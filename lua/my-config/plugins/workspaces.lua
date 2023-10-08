return {
    "natecraddock/workspaces.nvim",
    event = "VimEnter",
    config = function()
        require("workspaces").setup({
            hooks = {
                open = function()
                    vim.cmd("SessionRestore")
                end,
            }
        })

        require("telescope").load_extension("workspaces")

        local map = require("my-config.utils.mappings").map
        local mapping_options = { noremap = true, silent = true, nowait = true }

        map("n", "<Leader>ww", "<CMD>Telescope workspaces<CR>", mapping_options, "Telescope workspaces")
    end
}
