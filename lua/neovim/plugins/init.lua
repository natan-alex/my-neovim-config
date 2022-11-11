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
    use({ 
        "folke/which-key.nvim", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.which-key") end,
    })

    -- For file explorer
    use({ 
        "nvim-tree/nvim-tree.lua", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.nvim-tree") end,
        requires = { "nvim-tree/nvim-web-devicons" }, 
    })

    -- For file icons
    use({ 
        "nvim-tree/nvim-web-devicons", 
        config = function() require("nvim-web-devicons").setup() end,
    })

    -- Surround things
    use "tpope/vim-surround"

    -- Multiple cursors
    use({ 
        "mg979/vim-visual-multi", 
        config = function() 
	    local path = vim.fn.stdpath("config")
	    path = path .. "/lua/neovim/plugins/vim-visual-multi.vim"
	    vim.cmd("source" .. path) 
	end,
    })

    -- Nice bar
    use({ 
        "nvim-lualine/lualine.nvim", 
        config = function() require("neovim.plugins.lualine") end,
        requires = { "nvim-tree/nvim-web-devicons" }, 
    })

    -- To comment code
    use({ 
        "numToStr/Comment.nvim", 
        event = "BufRead",
        config = function() require("neovim.plugins.comment") end,
    })

    -- Completion plugins
    use({ 
        "hrsh7th/nvim-cmp", 
        event = "InsertEnter",
        config = function() require("neovim.plugins.cmp") end,
        requires = { "L3MON4D3/LuaSnip" }, 
    })

    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

    -- For nice completion menu
    use({ "onsails/lspkind.nvim", event = "BufRead" })

    -- Snippets
    use({ 
        "L3MON4D3/LuaSnip", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.luasnip") end,
    })

    use({ "rafamadriz/friendly-snippets", event = "BufWinEnter" })

    -- Lsp related
    use({ "neovim/nvim-lspconfig", event = "BufRead" })
    use "williamboman/nvim-lsp-installer"

    -- Floating terminal
    use({ 
        "akinsho/toggleterm.nvim", 
        config = function() require("neovim.plugins.toggleterm") end,
    })

    -- Syntax highlighting
    use({ 
        "nvim-treesitter/nvim-treesitter", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.treesitter") end,
    })

    -- Fuzzy finder
    use({ 
        "nvim-telescope/telescope.nvim", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.telescope") end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Git wrapper
    use({ 
        "TimUntersberger/neogit", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.neogit") end,
    })
    use "sindrets/diffview.nvim"

    -- Debugging
    use({ 
        "puremourning/vimspector", 
        config = function() require("neovim.plugins.vimspector") end,
    })

    -- For nice tab display
    use({ 
        "akinsho/bufferline.nvim", 
        event = "BufWinEnter",
        config = function() require("neovim.plugins.bufferline") end,
        requires = { "nvim-tree/nvim-web-devicons" }, 
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
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
