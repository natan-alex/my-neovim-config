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
    { "nvim-lua/plenary.nvim" },

    -- Themes
    { "catppuccin/nvim",       lazy = true },
    { "folke/tokyonight.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup() end,
    },

    -- Floating menus with mappings
    {
        "folke/which-key.nvim",
        config = function() require("which-key").setup() end
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        config = function() require("my-config.plugins.neo-tree") end
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

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("my-config.plugins.null-ls") end,
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

    -- Comment code
    {
        "numToStr/Comment.nvim",
        config = function() require("my-config.plugins.comment") end,
    },

    -- Snippets
    { "rafamadriz/friendly-snippets" },

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

    -- Telescope, my friend, just telescope
    {
        "nvim-telescope/telescope.nvim",
        config = function() require("my-config.plugins.telescope") end,
    },

    -- Show git modifications in code
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("my-config.plugins.gitsigns") end,
    },

    -- Nice tabs
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        config = function() require("my-config.plugins.bufferline") end,
    },

    -- Easy movementation in window
    {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
    },

    {
        "ggandor/flit.nvim",
        config = function() require("my-config.plugins.flit") end,
    },

    -- Nice indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup() end,
    },

    -- Show diagnostics in quickfix list and loclist
    {
        "folke/trouble.nvim",
        config = function() require("my-config.plugins.trouble") end,
    },

    -- Highlight words under cursor
    {
        "RRethy/vim-illuminate",
        config = function() require("my-config.plugins.vim-illuminate") end
    },

    -- "Breadcrumbs"
    {
        "utilyre/barbecue.nvim",
        dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
        config = function() require("barbecue").setup() end,
    },

    -- Auto close and rename tags
    {
        "windwp/nvim-ts-autotag",
        config = function() require("nvim-ts-autotag").setup() end
    },

    -- Session management
    {
        "rmagatti/auto-session",
        config = function() require("my-config.plugins.auto-session") end
    },

    -- Notify with nice popups and redirect cmdline to top (really cool)
    {
        "folke/noice.nvim",
        config = function() require("my-config.plugins.noice") end,
        requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    }
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
