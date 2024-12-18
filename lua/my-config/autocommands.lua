-- Highlight yanked region, see `:h lua-highlight`
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Handle large files
-- ref: https://vi.stackexchange.com/a/169/15292
vim.api.nvim_create_autocmd("BufReadPre", {
  group = vim.api.nvim_create_augroup("handle-large-files", { clear = true }),
  callback = function()
    local maximum_file_size = 10 * 1024 * 1024 -- 10MB
    local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

    if file_size > maximum_file_size then
      vim.cmd("syntax off")
      vim.opt.eventignore:append("all")
      vim.opt.cursorline = false
      vim.opt.relativenumber = false
      vim.opt.swapfile = false
      vim.opt.undolevels = 5
      vim.opt.bufhidden = "unload"
    end
  end,
})
