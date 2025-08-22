-- Enable all LSPs with config files inside lsp folder
local lsp_folder_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lsp")

---@type string[]
local lsp_names = {}

for name, type in vim.fs.dir(lsp_folder_path) do
  if type == "file" then
    name = string.gsub(name, ".lua", "")
    table.insert(lsp_names, name)
  end
end

vim.lsp.enable(lsp_names)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    ---- Keymaps
    local options = require("config.utils.mappings").options({
      buffer = event.buf,
      noremap = true,
      nowait = true,
    })

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, options())
    vim.keymap.set("n", "gs", vim.lsp.buf.declaration, options())
    vim.keymap.set("n", "gr", vim.lsp.buf.references, options())
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options())

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({
        count = 1,
        float = true,
      })
    end, options())

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({
        count = -1,
        float = true,
      })
    end, options())

    -- Information
    vim.keymap.set("n", "K", vim.lsp.buf.hover, options())
    vim.keymap.set({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, options())

    -- Code actions
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options())
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options())

    -- Diagnostics
    vim.keymap.set("n", "<leader>df", function()
      vim.diagnostic.open_float({
        scope = "buffer",
      })
    end, options())

    vim.keymap.set("n", "<leader>dl", function()
      vim.diagnostic.open_float({
        scope = "line",
      })
    end, options())

    vim.keymap.set("n", "<leader>dd", function()
      vim.diagnostic.setloclist({
        title = "Here we go...",
      })
    end, options())

    -- Formatting
    vim.keymap.set("n", "<A-f>", function()
      vim.lsp.buf.format({ timeout_ms = 300 })
    end, options())
  end,
})

vim.diagnostic.config({
  float = {
    border = "rounded",
    severity_sort = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✗",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.INFO] = "ℹ",
      [vim.diagnostic.severity.HINT] = "💡",
    }
  }
})

local nvim_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, options, ...)
  options = options or {}
  options.border = options.border or "rounded"
  return nvim_open_floating_preview(contents, syntax, options, ...)
end

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients == 0 then
    print("No LSP clients attached to current buffer")
  else
    for _, client in ipairs(clients) do
      print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = "Show LSP client info" })
