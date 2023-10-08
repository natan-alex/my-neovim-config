return {
    "natecraddock/workspaces.nvim",
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

        map("n", "<Leader>fw", "<CMD>Telescope workspaces<CR>", mapping_options, "Telescope workspaces")
    end
}
