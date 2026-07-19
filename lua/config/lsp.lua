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
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    -- Enable auto-completion
    if client:supports_method("textDocument/completion") then
      -- Trigger autocompletion on EVERY keypress
      local chars = {}

      for i = 32, 126 do
        table.insert(chars, string.char(i))
      end

      client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = true,
      })
    end

    ---- Keymaps
    local options = require("config.utils.mappings").options({
      buffer = event.buf,
      noremap = true,
      nowait = true,
    })

    -- Navigation
    vim.keymap.set(
      "n",
      "gd",
      vim.lsp.buf.definition,
      options({ desc = "LSP: go to definition" })
    )

    vim.keymap.set(
      "n",
      "gs",
      vim.lsp.buf.declaration,
      options({ desc = "LSP: go to declaration" })
    )

    vim.keymap.set(
      "n",
      "gr",
      vim.lsp.buf.references,
      options({ desc = "LSP: go to references" })
    )

    vim.keymap.set(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      options({ desc = "LSP: go to implementation" })
    )

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({
        count = 1,
        float = true,
      })
    end, options({ desc = "LSP: jump to next diagnostic" }))

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({
        count = -1,
        float = true,
      })
    end, options({ desc = "LSP: jump to previous diagnostic" }))

    -- Information
    vim.keymap.set("n", "K", vim.lsp.buf.hover, options())
    vim.keymap.set({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, options())

    -- Code actions
    vim.keymap.set(
      "n",
      "<leader>ca",
      vim.lsp.buf.code_action,
      options({ desc = "LSP: show code actions" })
    )

    vim.keymap.set(
      "n",
      "<leader>rn",
      vim.lsp.buf.rename,
      options({ desc = "LSP: rename" })
    )

    -- Diagnostics
    vim.keymap.set("n", "<leader>df", function()
      vim.diagnostic.open_float({
        scope = "buffer",
      })
    end, options({ desc = "LSP: show diagnostics" }))

    vim.keymap.set("n", "<leader>dl", function()
      vim.diagnostic.open_float({
        scope = "line",
      })
    end, options({ desc = "LSP: show line diagnostics" }))

    vim.keymap.set("n", "<leader>dd", function()
      vim.diagnostic.setloclist({
        title = "Here we go...",
      })
    end, options({ desc = "LSP: show diagnostics on loclist" }))

    -- Formatting
    vim.keymap.set("n", "<A-f>", function()
      vim.lsp.buf.format({ timeout_ms = 300 })
    end, options())

    -- Completion
    vim.keymap.set("i", "<C-space>", "<C-x><C-o>", options())
    vim.keymap.set("i", "<C-.>", "<C-x><C-o>", options())

    vim.keymap.set("i", "<Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-y>"
      else
        return "<Tab>"
      end
    end, options({ expr = true }))

    vim.keymap.set("i", "<S-Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-p>"
      else
        return "<S-Tab>"
      end
    end, options({ expr = true }))
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
    },
  },
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
