return {
    "olimorris/persisted.nvim",
    lazy = false,
    after = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("persisted").setup({
            silent = true,         -- silent nvim message when sourcing session file
            use_git_branch = true, -- create session files based on the branch of a git enabled repository
            autosave = true,       -- automatically save session files when exiting Neovim
            autoload = true,       -- automatically load the session for the cwd on Neovim startup
            follow_cwd = true,     -- change session file name to match current working directory if it changes
        })

        require("telescope").load_extension("persisted")
    end,
}
