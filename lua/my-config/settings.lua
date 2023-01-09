vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.undofile = true -- persistent undo
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.cursorline = true -- highlight the current line

vim.opt.mouse = "a" -- use mouse for selections and scroll

vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages

vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers

vim.opt.fileencoding = "utf-8"

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.lazyredraw = true

vim.opt.timeoutlen = 500
vim.opt.updatetime = 100 -- faster completion

vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- Turn on filetype detection and plugins 
-- and indentation based on filetype
vim.cmd("filetype plugin indent on")


-- Clipboard related
local winyank = "win32yank.exe"

if vim.fn.executable(winyank) == 1 then
    vim.g.clipboard = {
        name = "win32yank",
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
