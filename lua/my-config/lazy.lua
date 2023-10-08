local paths = require("my-config.utils.paths")

local lazypath = paths.join(vim.fn.stdpath("data"), "lazy", "lazy.nvim")

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "tomasiser/vim-code-dark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme codedark")
        end
    },

    -- Common for plugins
    { "nvim-lua/plenary.nvim" },

    { import = "my-config.plugins" },
}, {})
