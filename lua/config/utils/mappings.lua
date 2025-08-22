---@class Utils.Mappings
local M = {}

---@param defaults vim.keymap.set.Opts
---@return fun(overrides: vim.keymap.set.Opts?): vim.keymap.set.Opts
function M.options(defaults)
  return function(overrides)
    if overrides == nil then
      return defaults
    end

    local without_nils = {}

    for key, value in pairs(overrides) do
      if value ~= nil then
        without_nils[key] = value
      end
    end

    return vim.tbl_deep_extend("force", defaults, without_nils)
  end
end

return M
