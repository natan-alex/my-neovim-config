vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.undofile = true -- persistent undo

vim.opt.cursorline = false -- highlight the current line

vim.opt.mouse = "a" -- use mouse for selections and scroll

vim.opt.backup = false -- dont create a backup file

vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.fileencoding = "utf-8" -- the encoding written to a file

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.opt.swapfile = false -- creates a swapfile

vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.lazyredraw = true

vim.opt.timeoutlen = 500

vim.opt.backspace = "indent,eol,start"

-- do not highlight matching pairs
vim.g.loaded_matchparen = 1


-- Clipboard related
local winyank = "win32yank.exe"

if vim.fn.executable(winyank) then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = winyank .. " -i --crlf",
            ["*"] = winyank .. " -i --crlf",
        },
        paste = {
            ["+"] = winyank .. " -o --lf",
            ["*"] = winyank .. " -o --lf",
        },
        ["cache_enabled"] = 0,
    }
end
