local map = require("my-config.utils.mappings").map
local options = { nowait = true }

map("n", "<Leader>tt", "<CMD>terminal<CR>", options)

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-terminal", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd(":startinsert")
  end,
})

map("n", "<Leader>tv", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("L")
  vim.api.nvim_win_set_width(0, 40)
end, options)
