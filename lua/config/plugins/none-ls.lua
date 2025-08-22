return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local sources = {}

    if vim.fn.executable("stylua") == 1 then
      table.insert(sources, null_ls.builtins.formatting.stylua)
    end

    if vim.fn.executable("prettierd") == 1 then
      table.insert(sources, null_ls.builtins.formatting.prettierd)
    end

    if vim.fn.executable("biome") == 1 then
      table.insert(sources, null_ls.builtins.formatting.biome)
    end

    if vim.fn.executable("eslint_d") == 1 then
      table.insert(sources, require("none-ls.diagnostics.eslint_d"))
      table.insert(sources, require("none-ls.code_actions.eslint_d"))
    end

    null_ls.setup({
      sources = sources,
    })
  end,
}
