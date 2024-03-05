return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,

            highlight = {
                enable = true,

                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    return ok and stats and stats.size > max_filesize
                end,

                additional_vim_regex_highlighting = false,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Leader>s",
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                    scope_incremental = "<Leader><TAB>",
                },
            },

            indent = { enable = true },

            matchup = {
                enable = true,
                disable = {},
            },
        })

        require("nvim-treesitter.install").compilers = { "clang" }
    end,
}
