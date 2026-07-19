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
        go_in_plus = "<A-l>",
        go_out = "",
        go_out_plus = "<A-h>",
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

    vim.keymap.set("n", "<leader>e", function()
        if mini_files.close() then return end

        local path = vim.api.nvim_buf_get_name(0)

        if vim.fn.filereadable(path) == 1 then
          mini_files.open(path, false)
        else
          mini_files.open()
        end
      end,
      { desc = "Toggle Mini.Files", }
    )
  end,
}
