local myvimrc_path = vim.fn.expand("$MYVIMRC")

local function reload_config(_)
    local answer_for_sync_packer = vim.fn.input("Should sync packer? [y]es | [n]o: ")
    local should_sync_packer = answer_for_sync_packer:match("^y.*$")

    local luacache = (_G.__luacache or {}).cache

    for pkg, _ in pairs(package.loaded) do
        if pkg:match("^neovim.+$") then
            package.loaded[pkg] = nil

            if luacache then
                luacache[pkg] = nil
            end
        end
    end

    vim.cmd("source " .. myvimrc_path)
    vim.cmd("PackerCompile")
    --
    if should_sync_packer then
        vim.cmd("PackerSync")
    end
end

vim.api.nvim_create_user_command(
    "ReloadConfig",
    reload_config,
    { nargs = 0 }
)
