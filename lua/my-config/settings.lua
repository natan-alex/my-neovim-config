-- Some settings were inspired in https://github.com/jdhao/nvim-config

local paths = require("my-config.utils.paths")

-- Highlight current line
vim.opt.cursorline = true

-- Break line at words
vim.opt.linebreak = true

-- Do not show cursor position separated by comma
vim.opt.ruler = false

-- Align indent to next multiple value of shiftwidth
vim.opt.shiftround = true

-- Disable showing current mode on command line since
-- statusline plugins can show it.
vim.opt.showmode = false

-- Ask for confirmation when handling unsaved or read-only files
vim.opt.confirm = true

-- Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
vim.opt.tildeop = true

-- Enable true color support. Do not options.this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
vim.opt.termguicolors = true

-- Do not use visual and errorbells
vim.opt.visualbell = false
vim.opt.errorbells = false

-- Do not keep search results highlighted
-- and highlight as typing
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.autoindent = true

-- Ignore case in general, but become case-sensitive
-- when uppercase is present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show line number and relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Split window below/right when creating horizontal/vertical windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- The number of command and search history to keep
vim.opt.history = 100

-- Minimum lines to keep above and below cursor when scrolling
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 1

-- Height of cmdline space
vim.opt.cmdheight = 0
-- Maximum number of items to show in popup menu
vim.opt.pumheight = 15

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200 -- For CursorHold events

-- General tab settings
vim.opt.tabstop = 4    -- number of visual spaces per TAB
vim.opt.softtabstop = 4    -- number of spaces in tab when editing
vim.opt.shiftwidth = 4    -- number of spaces to use for autoindent
vim.opt.expandtab = true -- expand tab to spaces so that tabs are spaces

-- Disable backup file
vim.opt.backup = false
-- Disable swap file
vim.opt.swapfile = false
-- Persistent undo even after you close a file and re-open it
vim.opt.undofile = true
-- options.undo directory
vim.opt.undodir = vim.fn.expand(paths.join(vim.fn.stdpath("data"), "undo"))

-- Virtual edit is useful for visual block edit
vim.opt.virtualedit = "block"

-- Display column on the left with signs (for things like gitsigns)
vim.opt.signcolumn = "yes:1"

-- Use mouse to select and resize windows, etc.
vim.opt.mouse = "a"     -- Enable mouse in several mode
vim.opt.mousemodel = "popup" -- options.the behaviour of mouse
vim.opt.mousescroll = "ver:3,hor:10"

-- options.matching pairs of characters and highlight matching brackets
vim.opt.matchpairs:append("<:>")

-- Clipboard settings, always use clipboard for all delete, yank, change, put
-- operation, see https://stackoverflow.com/q/30691466/6064933
vim.opt.clipboard:append("unnamedplus")

-- Do not show "match xx of xx-- and other messages during auto-completion
vim.opt.shortmess:append("c")
-- Do not show search match count on bottom right
vim.opt.shortmess:append("S")
-- Disable showing intro message (:intro)
vim.opt.shortmess:append("I")

-- Ignore certain files and folders when globing
vim.opt.wildignorecase = true -- ignore file and dir name cases in cmd-completion
vim.opt.wildignore:append("*.DS_Store")
vim.opt.wildignore:append("*/target/*")
vim.opt.wildignore:append("*/node_modules/*")
vim.opt.wildignore:append("*.pyc,*.pkl")
vim.opt.wildignore:append("*.o,*.obj,*.dylib,*.bin,*.dll,*.exe")
vim.opt.wildignore:append("*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**")
vim.opt.wildignore:append("*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico")
vim.opt.wildignore:append("*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv")

-- Use rg for "greping"
if vim.fn.executable("rg") then
    vim.opt.grepprg = [[rg --vimgrep --no-heading --smart-case]]
    vim.opt.grepformat = [[%f:%l:%c:%m]]
end
