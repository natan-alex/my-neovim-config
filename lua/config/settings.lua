-- Leaders
vim.g.mapleader = ","
vim.g.maplocalleader = ","

---- Options
vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = true           -- Wrap lines
vim.opt.scrolloff = 5         -- Lines to keep above/below cursor
vim.opt.sidescrolloff = 5     -- Lines to keep left/right of cursor

-- Indentation
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search
vim.opt.ignorecase = true -- Case insensitive
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = false  -- Highlight search results
vim.opt.incsearch = true  -- Show matches incrementally

-- Line:column in statusline
vim.opt.ruler = false

-- Bells
vim.opt.visualbell = false
vim.opt.errorbells = false

vim.opt.confirm = true

vim.opt.shortmess:append("I") -- Do not show neovim intro screen

vim.opt.termguicolors = true  -- Enable true colors
vim.opt.signcolumn = "yes"    -- Show sign column
vim.opt.colorcolumn = "80"    -- Show right border at 80 characters
vim.opt.showmatch = false     -- Highlight matching brackets
vim.opt.cmdheight = 1         -- Command line height
vim.opt.showmode = false      -- Show mode in command line
vim.opt.pumheight = 10        -- Popup menu height
vim.opt.pumblend = 0          -- Popup menu transparency
vim.opt.winblend = 0          -- Floating window transparency
vim.opt.conceallevel = 0      -- Hide markup
vim.opt.concealcursor = ""    -- Hide cursor line markup
vim.opt.synmaxcol = 300       -- Syntax highlighting limit

vim.opt.completeopt = { "menuone", "popup", "fuzzy", "noinsert" }

-- Files
vim.opt.backup = false                  -- Create backup files
vim.opt.writebackup = false             -- Create backup before writing
vim.opt.swapfile = false                -- Create swap files
vim.opt.updatetime = 300                -- Faster completion
vim.opt.timeoutlen = 500                -- Key timeout duration
vim.opt.ttimeoutlen = 0                 -- Key code timeout
vim.opt.autoread = true                 -- Auto reload files changed outside vim
vim.opt.autowrite = false               -- Auto save

vim.opt.hidden = true                   -- Allow hidden buffers
vim.opt.backspace = "indent,eol,start"  -- Better backspace behavior
vim.opt.autochdir = false               -- Auto change directory
vim.opt.iskeyword:append("-")           -- Treat dash as part of word
vim.opt.path:append("**")               -- include subdirectories in search
vim.opt.selection = "inclusive"         -- Selection behavior
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true               -- Allow buffer modifications
vim.opt.encoding = "UTF-8"              -- Set encoding

-- Splits
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
vim.opt.wildignore:append("*/node_modules/*")

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Tabs
vim.opt.showtabline = 1 -- Show tabline when there are multiple tabs

-- Undoing
local undodir_path = vim.fn.expand(vim.fn.stdpath("data") .. "undo")

vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = undodir_path

-- Create undo directory if it doesn't exist
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end


---- Globals
-- Do not load certain plugins
-- Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim
-- All these plugins are related to checking files inside compressed files
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tarPlugin = 1

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1


---- Events
local augroup = vim.api.nvim_create_augroup("events", {})

-- Filetype specifics
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = {
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Resize splits when neovim is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")

    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Handle large files
-- ref: https://vi.stackexchange.com/a/169/15292
vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup,
  callback = function()
    local maximum_file_size = 10 * 1024 * 1024 -- 10MB
    local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

    if file_size > maximum_file_size then
      vim.cmd("syntax off")
      ---@diagnostic disable-next-line: undefined-field
      vim.opt.eventignore:append("all")
      vim.opt.cursorline = false
      vim.opt.relativenumber = false
      vim.opt.swapfile = false
      vim.opt.undolevels = 5
      vim.opt.bufhidden = "unload"
    end
  end,
})

-- Use rg for "greping"
if vim.fn.executable("rg") then
  vim.opt.grepprg = [[rg --vimgrep --no-heading --smart-case]]
  vim.opt.grepformat = [[%f:%l:%c:%m]]
end
