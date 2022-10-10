-- Theme
pcall(vim.cmd, "colorscheme onedark")

local settings = {
    number = true,
    relativenumber = true,

    hlsearch = false,
    incsearch = true,

    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    wrap = true,

    ignorecase = true,
    smartcase = true,

    termguicolors = true,

    undofile = true,            -- enable persistent undo

    cursorline = true,          -- highlight the current line

    mouse = "a",                -- use mouse for selections and scroll

    backup = false,             -- dont create a backup file

    cmdheight = 2,              -- more space in the neovim command line for displaying messages
    fileencoding = "utf-8",     -- the encoding written to a file

    showtabline = 2,            -- always show tabs

    smartindent = true,
    autoindent = true,

    splitbelow = true,          -- force all horizontal splits to go below current window
    splitright = true,          -- force all vertical splits to go to the right of current window

    swapfile = false,           -- creates a swapfile

    scrolloff = 2,
    sidescrolloff = 2,

    lazyredraw = true,

    timeoutlen = 500,
}

-- Set the options based on table
for name, value in pairs(settings) do
    vim.opt[name] = value
end
