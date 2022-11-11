local was_module_found, which_key = pcall(require, "which-key")

if not was_module_found then
    return
end

local options = {
    mode = "n",
    noremap = true,
    silent = true,
}

which_key.register({
    ["<Leader>"] = {
        s = {
            name = "sessions",
            s = { "<CMD>SaveSession<CR>", "Save session" },
            l = { "<CMD>LoadSession<CR>", "Load session" },
            d = { "<CMD>DeleteSession<CR>", "Delete session" },
        },
    }
}, options)
