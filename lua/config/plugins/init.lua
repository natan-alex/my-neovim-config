---@class SpecData
---@field priority integer|nil
---@field config_fn fun()|nil
---@field condition_fn (fun(): boolean)|nil
---@field build_cmd string|nil

---@param repo string
---@return string
local function github(repo)
  return "https://github.com/" .. repo
end

---@param x any
---@return boolean
local function is_non_empty_table(x)
  return type(x) == "table" and not vim.tbl_isempty(x)
end

---@param x any
---@return '"string"'|'"table"'|nil
local function spec_like_kind(x)
  if type(x) == "string" then
    return "string"
  elseif is_non_empty_table(x) then
    return "table"
  else
    return nil
  end
end

---@param s string
local function is_url(s)
  return s:match("^https?://") ~= nil
end

---@param spec string|vim.pack.Spec|nil
---@return string|nil
local function get_repo_from_spec(spec)
  local kind = spec_like_kind(spec)
  if kind == nil then
    return nil
  end

  ---@type string
  local repo

  if kind == "string" then
    ---@cast spec string
    repo = spec
    ---@cast spec table
  elseif kind == "table" and type(spec[1]) == "string" then
    repo = vim.trim(spec[1])
  else
    return nil
  end

  if repo:len() == 0 then
    return nil
  end

  return repo
end

---@param spec_like (string|table)
---@param specs (string|vim.pack.Spec)[]
local function process_spec_like(spec_like, specs)
  local kind = spec_like_kind(spec_like)
  if kind == nil then
    return
  end

  local repo = get_repo_from_spec(spec_like)
  if repo == nil then
    return
  end

  if kind == "table" then
    local enabled = spec_like["enable"]
    if type(enabled) == "boolean" and not enabled then
      return
    end

    local dependencies = spec_like["dependencies"]
    if dependencies ~= nil and is_non_empty_table(dependencies) then
      for _, dependency in ipairs(dependencies) do
        process_spec_like(dependency, specs)
      end
    end
  end

  if not is_url(repo) then
    repo = github(repo)
  end

  ---@type vim.pack.Spec
  local plugin_spec = {
    src = repo,
  }

  ---@type SpecData
  plugin_spec.data = {}

  if kind == "table" then
    local branch = spec_like["branch"]
    if type(branch) == "string" then
      branch = vim.trim(branch)
      if branch:len() > 0 then
        plugin_spec.version = branch
      end
    end

    local priority = spec_like["priority"]
    if type(priority) == "number" then
      plugin_spec.data.priority = priority
    end

    local config_fn = spec_like["config"]
    if type(config_fn) == "function" then
      plugin_spec.data.config_fn = config_fn
    end

    local condition_fn = spec_like["cond"]
    if type(condition_fn) == "function" then
      plugin_spec.data.condition_fn = condition_fn
    end

    local build_cmd = spec_like["build"]
    if type(build_cmd) == "string" then
      plugin_spec.data.build_cmd = build_cmd
    end
  end

  table.insert(specs, plugin_spec)
end

---@param specs vim.pack.Spec[]
local function sort_specs_by_priority(specs)
  table.sort(specs, function(a, b)
    local a_priority = a.data.priority
    local b_priority = b.data.priority

    if a_priority ~= nil and b_priority ~= nil then
      return a_priority > b_priority
    elseif a_priority ~= nil then
      return true
    else
      return false
    end
  end)
end

local plugins_dir = vim.fn.stdpath("config") .. "/lua/config/plugins"

---@type vim.pack.Spec[]
local specs = {}

for file_name, file_type in vim.fs.dir(plugins_dir) do
  if
    file_type == "file"
    and file_name ~= "init.lua"
    and file_name:match("%.lua$")
  then
    local module_path = "config.plugins." .. file_name:gsub("%.lua$", "")
    local loaded, module = pcall(require, module_path)
    if loaded then
      process_spec_like(module, specs)
    end
  end
end

sort_specs_by_priority(specs)

vim.pack.add(specs)

---@type vim.pack.Spec[]
local with_build_cmds = {}

for _, spec in ipairs(specs) do
  if spec.data.config_fn ~= nil then
    if spec.data.condition_fn == nil then
      pcall(spec.data.config_fn)
    else
      local ok, can_config = pcall(spec.data.condition_fn)
      if ok and can_config then
        pcall(spec.data.config_fn)
      end
    end
  end

  if spec.data.build_cmd ~= nil then
    table.insert(with_build_cmds, spec)
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    for _, spec in ipairs(with_build_cmds) do
      if
        (event.data.spec.name == spec.name)
        and ((event.data.kind == "install") or (event.data.kind == "update"))
      then
        vim.system({ spec.data.build_cmd }, { cwd = event.data.path })
      end
    end
  end,
})
