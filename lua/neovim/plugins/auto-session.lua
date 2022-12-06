vim.o.sessionoptions="blank,buffers,curdir,folds,tabpages,winsize,winpos,localoptions"

require("auto-session").setup {
  log_level = "error",
  auto_save_enabled = true,
  auto_restore_enabled = true,
}
