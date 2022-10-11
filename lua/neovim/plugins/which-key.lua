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
        },
    }
}, options)

local was_telescope_module_found, telescope = pcall(require, "telescope.builtin")

if not was_telescope_module_found then
    return
end

local function find_files()
    telescope.find_files()
end

local function recent_files()
    telescope.oldfiles()
end

local function find_buffers()
    telescope.buffers()
end

local function live_grep()
    telescope.live_grep()
end

local function find_in_current_buffer()
    local opt = {
        sorting_strategy = "ascending",
    }

    telescope.current_buffer_fuzzy_find(opt)
end

local function git_status()
    telescope.git_status()
end

local function git_commits()
    telescope.git_commits()
end

local function git_branches()
    telescope.git_branches()
end

which_key.register({
    ["<Leader>"] = {
        f = {
            name = "telescope files",
            f = { find_files, "Telescope Find file" },
            r = { recent_files, "Telescope Open recent file" },
            g = { live_grep, "Telescope Live grep" },
            b = { find_buffers, "Telescope List buffers" },
            c = { find_in_current_buffer, "Telescope Find in current buffer" },
        },
        g = {
            name = "telescope git",
            s = { git_status, "Telescope Git status" },
            b = { git_branches, "Telescope Git branches" },
            c = { git_commits, "Telescope Git commits" },
        }
    }
}, options)
