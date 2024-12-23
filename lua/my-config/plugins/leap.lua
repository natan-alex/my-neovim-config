return {
  "ggandor/leap.nvim",
  lazy = false,
  keys = {
    {
      "sf",
      "<Plug>(leap-forward-to)",
      mode = { "n", "x" },
      desc = "Leap jump forward",
    },
    {
      "sb",
      "<Plug>(leap-backward-to)",
      mode = { "n", "x" },
      desc = "Leap jump backward",
    },
  },
}
