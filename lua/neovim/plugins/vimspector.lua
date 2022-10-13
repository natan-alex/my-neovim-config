vim.g.vimspector_enable_mappings = "HUMAN"

local create_command = vim.api.nvim_create_user_command

local config_path = vim.fn.stdpath("config")

local types_and_corresponding_templates = {
    dotnet = config_path .. "/vimspector-configs/dotnet.json",
    rust = config_path .. "/vimspector-configs/rust.json",
}

local function get_table_keys(t)
    local keys = {}

    for key, _ in pairs(t) do
        table.insert(keys, key)
    end

    return keys
end

local function get_file_lines(path)
    local file = io.open(path, "r")
    local lines = {}

    for line in file:lines() do
        table.insert(lines, line)
    end

    file:close()
    return lines
end

local function generate_vimspector_file(params) 
    local file_type = params.args

    for key, value in pairs(types_and_corresponding_templates) do
        if file_type == key then
            local new_buffer = vim.api.nvim_create_buf({}, {})

            if new_buffer == 0 then 
                print("Failed to generate file")
                return
            end

            vim.api.nvim_set_current_buf(new_buffer)
            vim.api.nvim_buf_set_name(new_buffer, ".vimspector.json")
            vim.api.nvim_buf_set_lines(new_buffer, 0, 0, true, get_file_lines(value))

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
            return get_table_keys(types_and_corresponding_templates)
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
        G = { ":GenerateVimspectorFile ", "Generate vimspector file" },
        U = { "<CMD>VimspectorUpdate<CR>", "Update" },
        b = { "<CMD>call vimspector#ToggleBreakpoint()<CR>", "Toggle Breakpoint" },
        c = { "<CMD>call vimspector#Continue()<CR>", "Continue" },
        C = { "<CMD>call vimspector#RunToCursor()<CR>", "Run to Cursor" },
        o = { "<CMD>call vimspector#StepOver()<CR>", "Step Over" },
        O = { "<CMD>call vimspector#StepOut()<CR>", "Step Out" },
        s = { "<CMD>call vimspector#Launch()<CR>", "Start" },
        S = { "<CMD>call vimspector#Stop()<CR>", "Stop" },
        r = { "<CMD>call vimspector#Restart()<CR>", "Restart" },
        R = { "<CMD>VimspectorReset<CR>", "Reset" },
        i = { "<CMD>call vimspector#StepInto()<CR>", "Step Into" },
        I = { "<CMD>VimspectorInstall<CR>", "Install" },
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
