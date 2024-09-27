local files = require("my-config.utils.files")

return {
    "NeogitOrg/neogit",
    cond = files.inside_git_repo,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<Leader>gg", "<CMD>Neogit<CR>", mode = "n", desc = "Open Neogit" },
    },
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            auto_refresh = true,
            integrations = {
                diffview = true,
            },
        })
    end,
}
