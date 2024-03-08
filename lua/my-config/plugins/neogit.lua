return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            auto_refresh = true,
            integrations = {
                diffview = true,
            },
        })

        local map = require("my-config.utils.mappings").map
        local options = { noremap = true, silent = true }

        map("n", "<Leader>gg", "<CMD>Neogit<CR>", options, "Open Neogit")
        map("n", "<space>n", function() require("neogit").open { "commit" } end, options, "Neogit commit")
    end
}
