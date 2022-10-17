vim.g.vimspector_enable_mappings = "HUMAN"

local create_command = vim.api.nvim_create_user_command

local config_path = vim.fn.stdpath("config")
local templates_folder_name = "vimspector-templates"
local templates_folder_path = config_path .. "/" .. templates_folder_name .. "/"
local vimspector_file_name = ".vimspector.json"

local template_names_and_paths = {
    dotnet = templates_folder_path .. "dotnet.json",
    rust = templates_folder_path .. "rust.json",
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

local was_which_key_module_found, which_key = pcall(require, "which-key")

if not was_which_key_module_found then return end

local mapping_options = {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    v = {
        name = "Vimspector",
        G = { ":GenerateVimspectorFile", "Generate vimspector file" },
        I = { ":VimspectorInstall", "Install" },
        U = { "<CMD>VimspectorUpdate<CR>", "Update" },
        B = { "<CMD>VimspectorBreakpoints<CR>", "Breakpoints" },
        R = { "<CMD>VimspectorReset<CR>", "Reset" },
        b = { "<CMD>call vimspector#ToggleBreakpoint()<CR>", "Toggle Breakpoint" },
        c = { "<CMD>call vimspector#Continue()<CR>", "Continue" },
        C = { "<CMD>call vimspector#RunToCursor()<CR>", "Run to Cursor" },
        o = { "<CMD>call vimspector#StepOver()<CR>", "Step Over" },
        O = { "<CMD>call vimspector#StepOut()<CR>", "Step Out" },
        s = { "<CMD>call vimspector#Launch()<CR>", "Start" },
        S = { "<CMD>call vimspector#Stop()<CR>", "Stop" },
        r = { "<CMD>call vimspector#Restart()<CR>", "Restart" },
        i = { "<CMD>call vimspector#StepInto()<CR>", "Step Into" },
    }
}

which_key.register(mappings, mapping_options)

--      HUMAN MAPPINGS
-- F5	        <Plug>VimspectorContinue	                When debugging, continue. Otherwise start debugging.
--
-- F3	        <Plug>VimspectorStop	                        Stop debugging.
--
-- F4	        <Plug>VimspectorRestart	                        Restart debugging with the same configuration.
--
-- F6	        <Plug>VimspectorPause	                        Pause debuggee.
--
-- F9	        <Plug>VimspectorToggleBreakpoint	        Toggle line breakpoint on the current line.
--
-- <leader>F9	<Plug>VimspectorToggleConditionalBreakpoint	Toggle conditional line breakpoint or logpoint on the current line.
--
-- F8	        <Plug>VimspectorAddFunctionBreakpoint	        Add a function breakpoint for the expression under cursor
--
-- <leader>F8	<Plug>VimspectorRunToCursor	                Run to Cursor
--
-- F10	        <Plug>VimspectorStepOver	                Step Over
--
-- F11	        <Plug>VimspectorStepInto	                Step Into
--
-- F12	        <Plug>VimspectorStepOut	                        Step out of current function scope
