vim.wo.number = true
vim.wo.relativenumber = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.o.smarttab = true

vim.o.wrap = true

vim.o.hidden = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.o.undofile = true -- enable persistent undo

vim.o.cursorline = true -- highlight the current line

vim.o.mouse = "a" -- use mouse for selections and scroll

vim.o.backup = false -- dont create a backup file

vim.o.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.o.fileencoding = "utf-8" -- the encoding written to a file

vim.bo.smartindent = true
vim.bo.autoindent = true

vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window

vim.o.swapfile = false -- creates a swapfile

vim.o.scrolloff = 2
vim.o.sidescrolloff = 2

vim.o.lazyredraw = true

vim.o.timeoutlen = 500

vim.o.showmatch = true

vim.o.backspace = "indent,eol,start",


-- Clipboard related
vim.cmd([[set clipboard+=unnamedplus]])

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
