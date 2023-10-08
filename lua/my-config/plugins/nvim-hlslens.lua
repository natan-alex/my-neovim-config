return {
    "kevinhwang91/nvim-hlslens",
    event = "VimEnter",
    config = function()
        require("hlslens").setup()

        local map = require("my-config.utils.mappings").map
        local mapping_options = { silent = true, noremap = true, nowait = true }

        map("n", "<Leader>hh", "<CMD>noh<CR>", mapping_options)

        map("n", "*", [[*<CMD>lua require("hlslens").start()<CR>]], mapping_options)

        map("n", "n", [[<CMD>execute("normal! " . v:count1 . "n")<CR><CMD>lua require("hlslens").start()<CR>]], mapping_options)

        map("n", "N", [[<CMD>execute("normal! " . v:count1 . "N")<CR><CMD>lua require("hlslens").start()<CR>]], mapping_options)
    end
}
