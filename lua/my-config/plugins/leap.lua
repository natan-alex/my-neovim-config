return {
    "ggandor/leap.nvim",
    event = "VimEnter",
    config = function()
        vim.keymap.set({ "n", "x" }, "sf", "<Plug>(leap-forward-to)")
        vim.keymap.set({ "n", "x" }, "sb", "<Plug>(leap-backward-to)")
    end,
}
