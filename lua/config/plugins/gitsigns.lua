---@diagnostic disable: param-type-mismatch

return {
  "lewis6991/gitsigns.nvim",
  cond = function()
    local output = vim.fn.system("git rev-parse --is-inside-work-tree")

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
        end, options({ desc = "Gitsigns: go to next hunk" }))

        vim.keymap.set("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h" })
          else
            gitsigns.nav_hunk("prev")
          end
        end, options({ desc = "Gitsigns: go to previous hunk" }))

        vim.keymap.set(
          "n",
          "ghs",
          gitsigns.stage_hunk,
          options({ desc = "Gitsigns: stage/unstage hunk" })
        )

        vim.keymap.set(
          "n",
          "ghr",
          gitsigns.reset_hunk,
          options({ desc = "Gitsigns: reset hunk" })
        )

        vim.keymap.set("v", "ghs", function()
          gitsigns.stage_hunk(
            { vim.fn.line("."), vim.fn.line("v") },
            options({ desc = "Gitsigns: stage/unstage hunk" })
          )
        end)

        vim.keymap.set("v", "ghr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, options({ desc = "Gitsigns: reset hunk" }))

        vim.keymap.set(
          "n",
          "gbs",
          gitsigns.stage_buffer,
          options({ desc = "Gitsigns: stage buffer" })
        )

        vim.keymap.set(
          "n",
          "gbr",
          gitsigns.reset_buffer,
          options({ desc = "Gitsigns: reset buffer" })
        )

        vim.keymap.set(
          "n",
          "ghp",
          gitsigns.preview_hunk,
          options({ desc = "Gitsigns: preview hunk" })
        )

        vim.keymap.set(
          "n",
          "ghi",
          gitsigns.preview_hunk_inline,
          options({ desc = "Gitsigns: preview hunk inline" })
        )

        vim.keymap.set("n", "gbl", function()
          gitsigns.blame_line({ full = true })
        end, options({ desc = "Gitsigns: blame line full" }))

        vim.keymap.set(
          "n",
          "gcs",
          gitsigns.diffthis,
          options({ desc = "Gitsigns: diff changes" })
        )

        vim.keymap.set("n", "gh<S-q>", function()
          gitsigns.setqflist("all")
        end, options({ desc = "Gitsigns: quick fix list; all files" }))

        vim.keymap.set(
          "n",
          "ghq",
          gitsigns.setqflist,
          options({ desc = "Gitsigns: quick fix list; current buffer" })
        )

        -- Toggles
        vim.keymap.set(
          "n",
          "gb.",
          gitsigns.toggle_current_line_blame,
          options({ desc = "Gitsigns: toggle line blame" })
        )

        vim.keymap.set(
          "n",
          "gwd",
          gitsigns.toggle_word_diff,
          options({ desc = "Gitsigns: toggle word diff" })
        )

        -- Text object
        vim.keymap.set(
          { "o", "x" },
          "ih",
          gitsigns.select_hunk,
          options({ desc = "Gitsigns: select hunk" })
        )
      end,
    })
  end,
}
