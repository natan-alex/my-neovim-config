return {
  "https://codeberg.org/andyg/leap.nvim",
  config = function()
    local leap = require("leap")

    leap.opts.keys.next_target = { "<tab>", "<enter>" }
    leap.opts.keys.prev_target = { "<S-tab>", "<S-enter>" }

    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
    vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
  end,
}
