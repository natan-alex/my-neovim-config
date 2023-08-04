vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup {
    log_level = "error",
    auto_session_enabled = true,
    auto_session_enable_last_session = false,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = nil,
}
