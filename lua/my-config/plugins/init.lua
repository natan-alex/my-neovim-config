local paths = require("my-config.utils.paths")
local files = require("my-config.utils.files")

local plugins_path = paths.join(vim.fn.stdpath("config"), "lua", "my-config", "plugins")

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
    { "folke/tokyonight.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        event = "VimEnter",
        config = function() require("nvim-web-devicons").setup() end,
    },

    -- Floating menus with mappings
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function() require("which-key").setup() end
    },

    -- File explorer
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    --     dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    --     config = function() require("my-config.plugins.neo-tree") end
    -- },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function() require("my-config.plugins.nvim-tree") end,
    },

    -- Surround things
    { "tpope/vim-surround", event = "BufEnter" },
    -- { "machakann/vim-sandwich",   event = "BufEnter" },

    -- Lsp related
    {
        "williamboman/mason.nvim",
        event = "VimEnter",
        config = function() require("my-config.plugins.mason") end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function() require("my-config.plugins.mason-lspconfig") end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VimEnter",
        config = function() require("my-config.plugins.null-ls") end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        after = { "mason.nvim", "null-ls" },
        config = function() require("mason-null-ls").setup() end,
    },

    -- Multiple cursors
    {
        "mg979/vim-visual-multi",
        event = "BufEnter",
        config = function()
            local path = paths.join(plugins_path, "vim-visual-multi.vim")
            vim.cmd("source " .. path)
        end,
    },

    -- Nice bar
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function() require("my-config.plugins.lualine") end,
    },

    -- Comment code
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function() require("my-config.plugins.comment") end,
    },

    -- Snippets
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter"
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function() require("my-config.plugins.luasnip") end,
    },

    -- Completion plugins
    { "hrsh7th/cmp-path",         after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp",     after = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function() require("my-config.plugins.cmp") end,
    },

    -- Floating terminal
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function() require("my-config.plugins.toggleterm") end,
    },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("my-config.plugins.treesitter") end,
    },

    -- Fuzzy finders
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        after = "nvim-telescope/telescope-fzf-native.nvim",
        config = function() require("my-config.plugins.telescope") end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = function()
            if vim.g.is_linux or vim.g.is_mac then
                return "make"
            end

            return
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        end
    },
    -- {
    --     "Yggdroot/LeaderF",
    --     cmd = "Leaderf",
    --     build = ":LeaderfInstallCExtension",
    --     config = function()
    --         local path = paths.join(plugins_path, "leaderF.vim")
    --         vim.cmd("source " .. path)
    --     end
    -- },

    -- Git
    -- {
    --     "NeogitOrg/neogit",
    --     cmd = "Neogit",
    --     cond = files.inside_git_repo,
    --     config = function() require("my-config.plugins.neogit") end,
    --     dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" }
    -- },

    -- Show git modifications in code
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        cond = files.inside_git_repo,
        config = function() require("my-config.plugins.gitsigns") end,
    },

    -- Nice tabs
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        event = "BufEnter",
        config = function() require("my-config.plugins.bufferline") end,
    },

    -- Easy movementation in window
    {
        "ggandor/leap.nvim",
        event = "BufEnter",
        config = function() require("my-config.plugins.leap") end,
    },

    -- {
    --     "ggandor/flit.nvim",
    --     after = "leap.nvim",
    --     config = function() require("my-config.plugins.flit") end,
    -- },

    -- Nice indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        config = function() require("indent_blankline").setup() end,
    },

    -- Show diagnostics in quickfix list and loclist
    {
        "folke/trouble.nvim",
        event = "BufEnter",
        config = function() require("my-config.plugins.trouble") end,
    },

    -- Highlight words under cursor
    {
        "RRethy/vim-illuminate",
        event = "BufEnter",
        config = function() require("my-config.plugins.vim-illuminate") end
    },

    -- "Breadcrumbs"
    {
        "utilyre/barbecue.nvim",
        event = "BufEnter",
        dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic" },
        config = function() require("barbecue").setup() end,
    },

    -- Auto close and rename tags
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html" },
        config = function() require("my-config.plugins.nvim-ts-autotag") end
    },

    -- Session management
    {
        "rmagatti/auto-session",
        config = function() require("my-config.plugins.auto-session") end
    },

    -- Notify with nice popups and redirect cmdline to top (really cool)
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     config = function() require("my-config.plugins.noice") end,
    --     dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    -- },

    -- Show match number and index for searching
    {
        "kevinhwang91/nvim-hlslens",
        branch = "main",
        event = "BufEnter",
        config = function() require("my-config.plugins.nvim-hlslens") end
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("my-config.plugins.nvim-autopairs") end
    },

    -- Modern matchit implementation
    { "andymass/vim-matchup", event = "BufEnter" },

    {
        "gelguy/wilder.nvim",
        event = "VimEnter",
        config = function()
            local path = paths.join(plugins_path, "wilder.vim")
            vim.cmd("source " .. path)
        end
    },

    -- {
    --     "folke/zen-mode.nvim",
    --     cmd = "ZenMode",
    --     config = function() require("my-config.plugins.zen-mode") end
    -- }
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
