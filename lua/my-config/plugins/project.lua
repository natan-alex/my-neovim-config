require("project_nvim").setup()

require("telescope").load_extension("projects")

local map = require("my-config.utils.mappings").map
local mapping_options = { noremap = true, silent = true }

map("n", "<Leader>p", "<CMD>Telescope projects<CR>", mapping_options, "Telescope projects")


-- Telescope mappings

-- Normal mode     Insert mode             Action
-- f               <c-f>                   find_project_files
-- b               <c-b>                   browse_project_files
-- d               <c-d>                   delete_project
-- s               <c-s>                   search_in_project_files
-- r               <c-r>                   recent_project_files
-- w               <c-w>                   change_working_directory
