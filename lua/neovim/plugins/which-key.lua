local was_module_found, which_key = pcall(require, "which-key")

if not was_module_found then
    return
end

which_key.register({
    ["<Leader>"] = {
        f = {
            name = "file", -- group name
            f = { "<CMD>Telescope find_files<CR>", "Find File" },
            r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
            g = { "<CMD>Telescope live_grep<CR>", "Grep" },
            b = { "<CMD>Telescope buffers<CR>", "List buffers" },
        },
    }
})
