local function git_branch()
  local redirect_errors_to = (
    vim.fn.has("win32") == 1 and "NUL" or "/dev/null"
  )

  local branch_name = vim.fn.system(
    "git branch --show-current 2>" .. redirect_errors_to
  )

  if branch_name ~= "" then
    return branch_name:gsub("%s+", "")
  end

  return "Not in a git repo"
end

local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients == 0 then
    return "No LSPs attached"
  end

  local client_names = ""

  for i = 1, #clients - 1 do
    client_names = client_names .. clients[i].name .. ", "
  end

  client_names = client_names .. clients[#clients].name

  return "LSPs: " .. client_names
end

local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK",
  c = "COMMAND",
  s = "SELECT",
  S = "S-LINE",
  ["\19"] = "S-BLOCK",
  R = "REPLACE",
  r = "REPLACE",
  ["!"] = "SHELL",
  t = "TERMINAL"
}

local function mode_name()
  local mode = vim.fn.mode()
  return modes[mode] or mode:upper()
end

_G.statusline__mode_name = mode_name
_G.statusline__git_branch = git_branch
_G.statusline__lsp_status = lsp_status

vim.cmd([[
highlight StatusLine_Bold gui=bold cterm=bold
]])

vim.api.nvim_set_hl(0, "StatusLine_Bold", { bold = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.opt_local.statusline = table.concat({
      "  ",
      "%#StatusLine_Bold#",
      "%{v:lua.statusline__mode_name()}",
      "%#StatusLine#",
      " │ %f %h%m",
      " │ ",
      "%{v:lua.statusline__git_branch()}",
      " │ ",
      "%{v:lua.statusline__lsp_status()}",
      "%=",
      "%l/%L:%c",
      "  ",
    })
  end
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.opt_local.statusline = "  %f %h%m %= %l/%L:%c  "
  end
})
