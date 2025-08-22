return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      sync_install = false,

      modules = {},

      ignore_install = {},
      ensure_installed = {},

      highlight = {
        enable = true,

        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats =
          ---@diagnostic disable-next-line: undefined-field
              pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,

        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>s",
          node_incremental = "<tab>",
          node_decremental = "<S-tab>",
          scope_incremental = "<space>",
        },
      },

      indent = { enable = true },

      matchup = {
        enable = true,
        disable = {},
      },
    })
  end,
}
