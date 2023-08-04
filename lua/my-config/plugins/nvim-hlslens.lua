local hlslens = require("hlslens")

hlslens.setup({
    calm_down = true,
    nearest_only = true,
})

local activate_hlslens = function(key)
    local cmd = string.format("normal! %s%szzzv", vim.v.count1, key)
    local status, msg = pcall(vim.cmd, cmd)

    if not status then
        -- 13 is the index where real error message starts
        msg = msg:sub(13)
        vim.api.nvim_err_writeln(msg)
        return
    end

    hlslens.start()
end

vim.keymap.set("n", "n", "", {
    callback = function() activate_hlslens("n") end,
})

vim.keymap.set("n", "N", "", {
    callback = function() activate_hlslens("N") end,
})

vim.keymap.set("n", "*", "", {
    callback = function()
        vim.fn.execute("normal! *N")
        hlslens.start()
    end,
})

vim.keymap.set("n", "#", "", {
    callback = function()
        vim.fn.execute("normal! #N")
        hlslens.start()
    end,
})
