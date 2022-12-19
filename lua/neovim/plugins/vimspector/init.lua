local paths = require("neovim.utils.paths")

local create_command = vim.api.nvim_create_user_command

local templates_folder_path =  paths.join(vim.fn.stdpath("config"), "lua", "neovim", "plugins", "vimspector", "templates")
local vimspector_file_name = ".vimspector.json"

local template_names_and_paths = {
    dotnet = paths.join(templates_folder_path, "dotnet.json"),
    rust = paths.join(templates_folder_path, "rust.json"),
}

local template_names = vim.tbl_keys(template_names_and_paths)

local function get_file_lines(path)
    local file = io.open(path, "r")

    if not file then return end

    local lines = {}

    for line in file:lines() do
        table.insert(lines, line)
    end

    file:close()
    return lines
end

local function generate_vimspector_file(params)
    local template_name = params.args

    for name, path in pairs(template_names_and_paths) do
        if template_name == name then
            local new_buffer = vim.api.nvim_create_buf({}, {})

            if new_buffer == 0 then
                print("Failed to generate file")
                return
            end

            local file_content = get_file_lines(path)

            if not file_content then
                print("Failed to read file at " .. path)
                return
            end

            vim.api.nvim_set_current_buf(new_buffer)
            vim.api.nvim_buf_set_name(new_buffer, vimspector_file_name)
            vim.api.nvim_buf_set_lines(new_buffer, 0, 0, true, file_content)
            vim.opt.buftype = ""

            return
        end
    end
end

create_command(
    "GenerateVimspectorFile",
    generate_vimspector_file,
    {
        nargs = 1,
        complete = function()
            return template_names
        end
    }
)

require("neovim.plugins.vimspector.mappings")
