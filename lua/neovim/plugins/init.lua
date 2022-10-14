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
local was_packer_module_found, packer = pcall(require, "packer")

if not was_packer_module_found then
    return
end

-- Use packer popup window
packer.init {
    display = {
        open_fn = function()
            local util = require("packer.util")
            return util.float { border = "rounded" }
        end,
    },
}

-- Add plugins here
local start_packer_up = function(use)
    -- For packer to update itself
    use "wbthomason/packer.nvim"

    -- Colorschemes
    use "joshdick/onedark.vim"
    use 'Mofiqul/vscode.nvim'

    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons" -- for file icons

    -- Surround things
    use "tpope/vim-surround"

    -- Multiple cursors
    use "mg979/vim-visual-multi"

    -- Nice bar
    use "nvim-lualine/lualine.nvim"

    -- To comment code
    use "numToStr/Comment.nvim"

    -- Completion plugins
    use "hrsh7th/nvim-cmp" -- completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- For nice completion menu
    use "onsails/lspkind.nvim"

    -- Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets"

    -- Lsp related
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    use "simrat39/rust-tools.nvim"

    -- Floating terminal
    use "akinsho/toggleterm.nvim"

    -- Syntax highlighting
    use "nvim-treesitter/nvim-treesitter"

    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- For floating menus with mappings
    use "folke/which-key.nvim"

    -- Git wrapper
    use "tpope/vim-fugitive"

    -- Debugging
    use "puremourning/vimspector"

    -- For nice tab display
    use "akinsho/bufferline.nvim"

    if can_sync_packer then
        packer.sync()
    end
end


packer.startup(start_packer_up)


-- call plugins configurations
require("neovim.plugins.bufferline")
require("neovim.plugins.cmp")
require("neovim.plugins.comment")
require("neovim.plugins.lualine")
require("neovim.plugins.luasnip")
require("neovim.plugins.nvim-tree")
require("neovim.plugins.nvim-web-devicons")
require("neovim.plugins.rust-tools")
require("neovim.plugins.telescope")
require("neovim.plugins.toggleterm")
require("neovim.plugins.treesitter")
require("neovim.plugins.vim-visual-multi")
require("neovim.plugins.vimspector")
require("neovim.plugins.which-key")


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
