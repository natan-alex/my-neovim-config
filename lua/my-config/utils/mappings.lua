local M = {}

function M.map(mode, mapping, command, options, description)
  options = options or {}
  options.desc = description
  vim.keymap.set(mode, mapping, command, options)
end

return M
