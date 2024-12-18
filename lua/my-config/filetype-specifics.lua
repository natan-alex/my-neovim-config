vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("indent-sizes", { clear = true }),
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
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
