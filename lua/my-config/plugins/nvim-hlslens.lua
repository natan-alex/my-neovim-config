return {
    "kevinhwang91/nvim-hlslens",
    event = "BufEnter",
    config = function()
        require("hlslens").setup()

        local mapping_options = { silent = true, noremap = true }

        vim.api.nvim_set_keymap('n', 'n',
            [[<CMD>execute('normal! ' . v:count1 . 'n')<CR><CMD>lua require('hlslens').start()<CR>]], mapping_options)

        vim.api.nvim_set_keymap('n', 'N',
            [[<CMD>execute('normal! ' . v:count1 . 'N')<CR><CMD>lua require('hlslens').start()<CR>]], mapping_options)

        vim.api.nvim_set_keymap('n', '*', [[*<CMD>lua require('hlslens').start()<CR>]], mapping_options)

        vim.api.nvim_set_keymap('n', '<Leader>hh', '<CMD>noh<CR>', mapping_options)
    end
}
