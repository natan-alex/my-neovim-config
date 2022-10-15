local Module = {}

function Module.execute_on_toggleterm(command)
    return function()
        local was_toggleterm_module_found, toggleterm = pcall(require, "toggleterm")
        if not was_toggleterm_module_found then return end
        local term = require("toggleterm.terminal").get(1)
        if term ~= nil then term:shutdown() end
        toggleterm.exec(command)
    end
end

Module.which_key_mapping_options = {
    mode = "n", -- NORMAL mode
    prefix = "<Leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

return Module
