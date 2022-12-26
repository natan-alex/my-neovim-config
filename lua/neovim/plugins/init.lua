local paths = require("neovim.utils.paths")

local install_path = paths.join(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim")

local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true

    print("Packer not installed yet. Installing...")

    local repo_url = "https://github.com/wbthomason/packer.nvim"

    vim.fn.execute("!git clone --depth 1 " .. repo_url .. " " .. install_path)

    vim.cmd("packadd packer.nvim")

    print("Packer installed successfully")
end

local packer = require("packer")

packer.init({
    display = {
        open_fn = function()
            local util = require("packer.util")
            return util.float({ border = "rounded" })
        end,
    },
})

packer.startup(function(use)
    -- For packer to update itself
    use "wbthomason/packer.nvim"

    -- Common for plugins
    use "nvim-lua/plenary.nvim"

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "folke/tokyonight.nvim" }
    use { "navarasu/onedark.nvim" }

    -- For file icons
    use {
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup() end,
    }

    -- For floating menus with mappings
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup() end
    }

    -- For file explorer
    use {
        "nvim-tree/nvim-tree.lua",
        config = function() require("neovim.plugins.nvim-tree") end,
        requires = { "nvim-tree/nvim-web-devicons" },
    }

    -- Surround things
    use { "tpope/vim-surround" }

    -- Lsp related
    use { "neovim/nvim-lspconfig" }

    use {
        "williamboman/mason.nvim",
        config = function() require("neovim.plugins.mason") end,
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        config = function() require("neovim.plugins.mason-lspconfig") end,
        requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    }

    -- Better lsp interactions like renaming, code actions, etc
    use {
        "glepnir/lspsaga.nvim",
        config = function() require("neovim.plugins.lspsaga") end,
    }

    -- Multiple cursors
    use {
        "mg979/vim-visual-multi",
        config = function()
            local paths = require("neovim.utils.paths")
            local path = vim.fn.stdpath("config")
            path = paths.join(path, "lua", "neovim", "plugins", "vim-visual-multi.vim")
            vim.cmd("source " .. path)
        end,
    }

    -- Nice bar
    use {
        "nvim-lualine/lualine.nvim",
        config = function() require("neovim.plugins.lualine") end,
        requires = { "nvim-tree/nvim-web-devicons" },
    }

    -- To comment code
    use {
        "numToStr/Comment.nvim",
        config = function() require("neovim.plugins.comment") end,
    }

    -- Snippets
    use { "rafamadriz/friendly-snippets" }

    use {
        "L3MON4D3/LuaSnip",
        config = function() require("neovim.plugins.luasnip") end,
    }

    -- Completion plugins
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function() require("neovim.plugins.cmp") end,
    }

    -- Floating terminal
    use {
        "akinsho/toggleterm.nvim",
        config = function() require("neovim.plugins.toggleterm") end,
    }

    -- Syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("neovim.plugins.treesitter") end,
    }

    -- Additional text objects via treesitter
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }

    -- Telescope, my friend, just telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function() require("neovim.plugins.telescope") end,
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- Use fzf to make telescope fuzzy finder faster
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable("make") == 1,
        config = function() require("neovim.plugins.telescope-fzf-native") end
    }

    -- telescope neoclip extension for clipboard remembering
    use {
        "AckslD/nvim-neoclip.lua",
        requires = { "nvim-telescope/telescope.nvim" },
        config = function() require("neovim.plugins.neoclip") end,
    }

    -- Git
    use {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        config = function() require("neovim.plugins.neogit") end,
    }

    -- To show git modifications in code
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("neovim.plugins.gitsigns") end,
    }

    -- Debugging
    use {
        "puremourning/vimspector",
        ft = { "cs", "rust" },
        config = function() require("neovim.plugins.vimspector") end
    }

    -- For nice tab display
    use {
        "romgrk/barbar.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function() require("neovim.plugins.barbar") end,
    }

    -- For auto pairing things
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }

    -- Easy move in window
    use {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
    }

    -- Cache modules
    use {
        "lewis6991/impatient.nvim",
        config = function() require("impatient") end,
    }

    -- Nice indentation lines
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup() end,
    }

    -- To add more commands like ciw, di', etc
    use { "wellle/targets.vim" }

    -- Repeat many things with dot
    use { "tpope/vim-repeat" }

    -- Better diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("neovim.plugins.trouble") end,
    }

    -- To easily list and jump between functions, methods, etc in code
    use {
      "stevearc/aerial.nvim",
      config = function() require("neovim.plugins.aerial") end
    }

    -- Nice winbar
    use {
        "utilyre/barbecue.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "smiteshp/nvim-navic",
            "kyazdani42/nvim-web-devicons",
        },
        after = "nvim-web-devicons",
        config = function() require("barbecue").setup() end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("neovim.plugins.null-ls") end,
    }

    if is_bootstrap then
        packer.sync()
    end
end)

-- theme
require("neovim.plugins.themes")

-- packer commands

-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
-- :PackerCompile

-- Remove any disabled or unused plugins
-- :PackerClean

-- Clean, then install missing plugins
-- :PackerInstall

-- Clean, then update and install plugins
-- :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync

-- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale
