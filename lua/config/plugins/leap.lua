return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require("leap")

    leap.opts.keys.next_target = { "<tab>", "<enter>" }
    leap.opts.keys.prev_target = { "<S-tab>", "<S-enter>" }

    vim.keymap.set({ "n", "x" }, "sf", "<Plug>(leap-forward)", {
      desc = "Leap jump forward"
    })

    vim.keymap.set({ "n", "x" }, "sb", "<Plug>(leap-backward)", {
      desc = "Leap jump backward"
    })
  end,
}
