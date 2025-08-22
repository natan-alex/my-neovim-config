---@diagnostic disable: param-type-mismatch

return {
  "lewis6991/gitsigns.nvim",
  cond = function()
    local output = vim.fn.system(
      "git rev-parse --is-inside-work-tree"
    )

    return vim.fn.match(output, "true") ~= -1
  end,
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local options = require("config.utils.mappings").options({
          buffer = bufnr,
        })

        vim.keymap.set("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h" })
          else
            gitsigns.nav_hunk("next")
          end
        end, options())

        vim.keymap.set("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h" })
          else
            gitsigns.nav_hunk("prev")
          end
        end, options())

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, options())
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, options())

        vim.keymap.set("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, options())
        end)

        vim.keymap.set("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, options())

        vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, options())
        vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, options())
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, options())
        vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline, options())

        vim.keymap.set("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, options())

        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, options())

        vim.keymap.set("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, options())

        vim.keymap.set("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end, options())

        vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, options())

        -- Toggles
        vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, options())
        vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, options())

        -- Text object
        vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, options())
      end,
    })
  end,
}
