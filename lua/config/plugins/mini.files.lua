return {
  "echasnovski/mini.files",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local mini_files = require("mini.files")

    mini_files.setup({
      mappings = {
        close = "q",
        go_in = "",
        go_in_plus = "gl",
        go_out = "",
        go_out_plus = "gh",
        mark_goto = "'",
        mark_set = "m",
        reset = "<bs>",
        reveal_cwd = "<space>",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<C-h>",
        trim_right = "<C-l>",
      },
    })

    local function toggle_mini()
      if mini_files.close() then
        return
      end

      local path = vim.api.nvim_buf_get_name(0)

      if vim.fn.filereadable(path) == 1 then
        mini_files.open(path, false)
      else
        mini_files.open()
      end
    end

    vim.keymap.set("n", "<leader>e", toggle_mini, { desc = "Toggle Mini.Files" })
    vim.keymap.set("n", "ge", toggle_mini, { desc = "Toggle Mini.Files" })
  end,
}
