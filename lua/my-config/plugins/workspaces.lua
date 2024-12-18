return {
  "natecraddock/workspaces.nvim",
  lazy = false,
  after = { "nvim-telescope/telescope.nvim" },
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<C-p>", "<CMD>Telescope workspaces<CR>", mode = "n" },
    { "<Leader>wa", "<CMD>WorkspacesAdd<CR>", mode = "n" },
    { "<Leader>wd", "<CMD>WorkspacesRemove<CR>", mode = "n" },
  },
  config = function()
    require("workspaces").setup({
      hooks = {
        open_pre = "SessionSave",
        open = {
          "silent %bdelete!",
          "SessionRestore",
        },
      },
    })

    require("telescope").load_extension("workspaces")
  end,
}
