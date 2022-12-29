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

local plugins = {
    -- Common for plugins
    { "nvim-lua/plenary.nvim",  },

    -- Themes
    { "catppuccin/nvim" },
    { "folke/tokyonight.nvim" },
    { "navarasu/onedark.nvim" },

    -- For file icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup() end,
    },

    -- For floating menus with mappings
    {
        "folke/which-key.nvim",
        config = function() require("which-key").setup() end
    },

    -- For file explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = function() require("my-config.plugins.nvim-tree") end,
    },

    -- Surround things
    { "tpope/vim-surround" },

    -- Lsp related
    { "neovim/nvim-lspconfig" },

    {
        "williamboman/mason.nvim",
        config = function() require("my-config.plugins.mason") end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function() require("my-config.plugins.mason-lspconfig") end,
    },

    -- Better lsp interactions like renaming, code actions, etc
    {
        "glepnir/lspsaga.nvim",
        config = function() require("my-config.plugins.lspsaga") end,
    },

    -- Multiple cursors
    {
        "mg979/vim-visual-multi",
        config = function()
            local path = vim.fn.stdpath("config")
            path = paths.join(path, "lua", "my-config", "plugins", "vim-visual-multi.vim")
            vim.cmd("source " .. path)
        end,
    },

    -- Nice bar
    {
        "nvim-lualine/lualine.nvim",
        config = function() require("my-config.plugins.lualine") end,
    },

    -- To comment code
    {
        "numToStr/Comment.nvim",
        config = function() require("my-config.plugins.comment") end,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        config = function() require("my-config.plugins.luasnip") end,
    },

    -- Completion plugins
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },

    { "saadparwaiz1/cmp_luasnip" },

    {
        "hrsh7th/nvim-cmp",
        config = function() require("my-config.plugins.cmp") end,
    },

    -- Floating terminal
    {
        "akinsho/toggleterm.nvim",
        config = function() require("my-config.plugins.toggleterm") end,
    },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("my-config.plugins.treesitter") end,
    },

    -- Additional text objects via treesitter
    { "nvim-treesitter/nvim-treesitter-textobjects" },

    -- Telescope, my friend, just telescope
    {
        "nvim-telescope/telescope.nvim",
        config = function() require("my-config.plugins.telescope") end,
    },

    -- fzf to make telescope fuzzy finder faster
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
        config = function() require("my-config.plugins.telescope-fzf-native") end
    },

    -- telescope neoclip extension for clipboard remembering
    {
        "AckslD/nvim-neoclip.lua",
        config = function() require("my-config.plugins.neoclip") end,
    },

    -- Git
    { "sindrets/diffview.nvim" },

    {
        "TimUntersberger/neogit",
        config = function() require("my-config.plugins.neogit") end,
    },

    -- To show git modifications in code
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("my-config.plugins.gitsigns") end,
    },

    -- Debugging
    {
        "puremourning/vimspector",
        ft = { "cs", "rust" },
        config = function() require("my-config.plugins.vimspector") end
    },

    -- For nice tab display
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        config = function() require("my-config.plugins.bufferline") end,
    },

    -- For auto pairing things
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    },

    -- Easy move in window
    {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
    },

    -- Nice indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup() end,
    },

    -- To add more commands like ciw, di', etc
    { "wellle/targets.vim" },

    -- Repeat many things with dot
    { "tpope/vim-repeat" },

    -- Better diagnostics
    {
        "folke/trouble.nvim",
        config = function() require("my-config.plugins.trouble") end,
    },

    -- To easily list and jump between functions, methods, etc in code
    {
        "stevearc/aerial.nvim",
        config = function() require("my-config.plugins.aerial") end
    },

    -- Nice winbar
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "smiteshp/nvim-navic",
        },
        config = function() require("barbecue").setup() end,
    },
}

require("lazy").setup(plugins, {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- theme
require("my-config.plugins.themes")
