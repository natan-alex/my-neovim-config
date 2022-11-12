local which_key_found, which_key = pcall(require, "which-key")

if not which_key_found then
    vim.notify("which-key module not found. Error: " .. which_key, "error")
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
