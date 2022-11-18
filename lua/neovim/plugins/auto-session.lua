local auto_session_found, auto_session = pcall(require, "auto-session")

if not auto_session_found then
    vim.notify("auto-session module not found. Error: " .. auto_session, "error")
    return
end

auto_session.setup {
  log_level = "error",
  auto_save_enabled = true,
  auto_restore_enabled = true,
}
