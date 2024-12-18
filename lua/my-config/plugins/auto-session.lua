return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<Leader>ws", "<CMD>SessionSearch<CR>", desc = "Session search" },
  },
  config = function()
    require("auto-session").setup({
      use_git_branch = true, -- Include git branch name in session name
    })
  end,
}
