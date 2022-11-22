local packer_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. packer_path

local can_sync_packer = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Packer not installed yet. Installing...")

    local github_repo_url = "https://github.com/wbthomason/packer.nvim"

    vim.fn.system({
        "git", "clone", "--depth", "1", github_repo_url, install_path
    })

    vim.cmd("packadd packer.nvim")
    can_sync_packer = true

    print("Packer installed successfully")
end

-- Use a protected call to get packer module
local packer_found, packer = pcall(require, "packer")

if not packer_found then
    return
end

-- Use packer popup window
packer.init({
    display = {
        open_fn = function()
            local util = require("packer.util")
            return util.float { border = "rounded" }
        end,
    },
})

-- Add plugins here
packer.startup(function(use)
    -- For packer to update itself
    use "wbthomason/packer.nvim"

    -- Common for plugins
    use "nvim-lua/plenary.nvim"

    -- Colorschemes
    use "joshdick/onedark.vim"

    -- For floating menus with mappings
    use {
        "folke/which-key.nvim",
        config = function() require("neovim.plugins.which-key") end,
    }

    -- For file explorer
    use {
        "nvim-tree/nvim-tree.lua",
        config = function() require("neovim.plugins.nvim-tree") end,
        requires = { "nvim-tree/nvim-web-devicons" },
    }

    -- For file icons
    use {
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup() end,
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

    use {
        "glepnir/lspsaga.nvim",
        config = function() require("neovim.plugins.lspsaga") end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("neovim.plugins.null-ls") end,
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- Multiple cursors
    use {
        "mg979/vim-visual-multi",
        config = function()
	    local path = vim.fn.stdpath("config")
	    path = path .. "/lua/neovim/plugins/vim-visual-multi.vim"
	    vim.cmd("source" .. path)
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
    use {
        "L3MON4D3/LuaSnip",
        config = function() require("neovim.plugins.luasnip") end,
    }

    use { "rafamadriz/friendly-snippets" }

    -- Completion plugins
    use {
        "hrsh7th/nvim-cmp",
        config = function() require("neovim.plugins.cmp") end,
    }

    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "saadparwaiz1/cmp_luasnip" }

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

    -- Telescope, my friend, just telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function() require("neovim.plugins.telescope") end,
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- telescope neoclip extension for clipboard remembering
    use {
        "AckslD/nvim-neoclip.lua",
        requires = { "nvim-telescope/telescope.nvim" },
        config = function() require("neovim.plugins.neoclip").setup() end,
    }

    -- Git
    use {
        "tpope/vim-fugitive",
        config = function() require("neovim.plugins.vim-fugitive") end
    }

    -- To show git modifications in code
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("neovim.plugins.gitsigns") end,
    }

    -- Debugging
    use {
        "mfussenegger/nvim-dap",
        ft = { "cs" },
        config = function() require("neovim.plugins.dap") end,
    }

    use {
        "rcarriga/nvim-dap-ui",
        config = function() require("neovim.plugins.dap.dapui") end,
        requires = { "mfussenegger/nvim-dap" },
        after = { "nvim-dap" },
    }

    -- For nice tab display
    use {
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        config = function() require("neovim.plugins.bufferline") end,
        requires = { "nvim-tree/nvim-web-devicons" },
    }

    -- For auto pairing things
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }

    -- Rust related
    use {
	"simrat39/rust-tools.nvim",
	ft = { "rs" },
	config = function() require("neovim.plugins.rust-tools") end,
	requires = { "neovim/nvim-lspconfig" },
    }

    -- Easy move in window
    use {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
    }

    -- Session management
    use {
        "rmagatti/auto-session",
        config = function() require("neovim.plugins.auto-session") end
    }

    -- Code navigation
    use {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        config = function() require("neovim.plugins.aerial") end
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

    if can_sync_packer then
        packer.sync()
    end
end)


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
