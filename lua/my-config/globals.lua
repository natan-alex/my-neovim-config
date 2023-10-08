-- Leader
vim.g.mapleader = ","

local function feature_exists(feature)
    return vim.fn.has(feature) == 1
end

vim.g.is_mac   = feature_exists("macunix")
vim.g.is_win   = feature_exists("win32") or feature_exists("win64")
vim.g.is_linux = feature_exists("unix") and not feature_exists("macunix")


-- Disable loading certain plugins
-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin      = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim
-- All these plugins are related to checking files inside compressed files
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_tarPlugin         = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1

-- Disable sql omni completion
vim.g.loaded_sql_completion    = 1
