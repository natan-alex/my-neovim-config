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

local was_telescope_module_found, telescope = pcall(require, "telescope.builtin")

if not was_telescope_module_found then
    return
end

which_key.register({
    ["<Leader>"] = {
        t = {
            name = "telescope files",
            f = { telescope.find_files, "Telescope Find file" },
            r = { telescope.oldfiles, "Telescope Open recent file" },
            g = { telescope.live_grep, "Telescope Live grep" },
            b = { telescope.buffers, "Telescope List buffers" },
            d = { telescope.diagnostics, "Telescope Diagnostics" },
            h = { telescope.help_tags, "Telescope Help tags" },
            c = {
                function()
                    local opt = { sorting_strategy = "ascending" }
                    telescope.current_buffer_fuzzy_find(opt)
                end,
                "Telescope Find in current buffer"
            },
        },
        g = {
            name = "telescope git",
            s = { telescope.git_status, "Telescope Git status" },
            b = { telescope.git_branches, "Telescope Git branches" },
            c = { telescope.git_commits, "Telescope Git commits" },
        },
    }
}, options)
