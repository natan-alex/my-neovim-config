local options = require("config.utils.mappings").options({
  nowait = true
})

vim.keymap.set("n", "<leader>tt", "<cmd>terminal<cr>", options())

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-terminal", {}),
  callback = function(event)
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", {
      buffer = event.buf,
    })

    vim.keymap.set("t", "<C-Space>", "<C-\\><C-n>", {
      buffer = event.buf,
    })

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd(":startinsert")
  end,
})
