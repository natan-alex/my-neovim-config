" let the initial folding state be that all folds are closed.
set foldlevel=0

" Use nvim-treesitter for folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set tabstop=2
set softtabstop=2
set shiftwidth=2
