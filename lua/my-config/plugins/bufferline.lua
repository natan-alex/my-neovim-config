return {
  "akinsho/bufferline.nvim",
  lazy = false,
  keys = {
    -- Move to previous/next
    {
      "<A-l>",
      "<CMD>BufferLineCycleNext<CR>",
      mode = "n",
      desc = "Bufferline go to next buffer",
    },
    {
      "<A-h>",
      "<CMD>BufferLineCyclePrev<CR>",
      mode = "n",
      desc = "Bufferline go to previous buffer",
    },

    -- Re-order to previous/next
    {
      "<A-L>",
      "<CMD>BufferLineMoveNext<CR>",
      mode = "n",
      desc = "Bufferline move buffer right",
    },
    {
      "<A-H>",
      "<CMD>BufferLineMovePrev<CR>",
      mode = "n",
      desc = "Bufferline move buffer left",
    },
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        truncate_names = true, -- whether or not tab names should be truncated
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, _, _, _)
          return "(" .. count .. ")"
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = false,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        hover = { enabled = false },
      },
    })
  end,
}
