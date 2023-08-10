" Some settings were inspired in https://github.com/jdhao/nvim-config

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Align indent to next multiple value of shiftwidth
set shiftround

" Highlight current line
set cursorline

" Wrap text
set wrap

" Do not show cursor position separated by comma
set noruler

" Do not keep search results highlighted
" and highlight as typing
set nohlsearch incsearch

set smartindent autoindent

" Ignore case in general, but become case-sensitive 
" when uppercase is present
set ignorecase smartcase

" Show line number and relative line number
set number relativenumber

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>

" Break line at predefined characters
set linebreak

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Height of cmdline space
set cmdheight=1

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500
set updatetime=200  " For CursorHold events

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" List all matches and complete till longest common string
set wildmode=list:longest

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=1
set sidescrolloff=1

" Disable showing current mode on command line since 
" statusline plugins can show it.
set noshowmode

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Persistent undo even after you close a file and re-open it
set undofile

" Disable swap file
set noswapfile

" Create backup for files
set backup  
" Copy the original file to backupdir and overwrite it
set backupcopy=yes
" Skip backup for patterns in option wildignore
let &backupskip=&wildignore

" Set backup directory
let g:backupdir=expand(stdpath('data') . '/backup//')
let &backupdir=g:backupdir

" Set undo directory
let g:undodir=expand(stdpath('data') . '/undo//')
let &undodir=g:undodir

" Do not use visual and errorbells
set visualbell noerrorbells

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

" Use mouse to select and resize windows, etc.
set mouse=a             " Enable mouse in several mode
set mousemodel=popup    " Set the behaviour of mouse
set mousescroll=ver:3,hor:10

" Do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c
" Do not show search match count on bottom right
set shortmess+=S
" Disable showing intro message (:intro)
set shortmess+=I

" Maximum number of items to show in popup menu
set pumheight=15

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Use rg for 'greping'
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Enable true color support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
set termguicolors

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

" Display column with signs (for things like gitsigns)
set signcolumn=yes:1

" Remove certain character from file name pattern matching
set isfname-==
set isfname-=,
