local autopairs = require("nvim-autopairs")

autopairs.setup({
    fast_wrap = {},
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})
