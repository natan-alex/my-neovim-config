return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    local already_installed = treesitter.get_installed()

    -- Auto-install and start parsers for any buffer
    vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
      desc = "Enable Treesitter",
      callback = function(event)
        local bufnr = event.buf
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

        -- Skip if no filetype
        if filetype == "" then return end

        -- Get parser name based on filetype
        local parser_name = vim.treesitter.language.get_lang(filetype)
        if not parser_name then
          vim.notify(vim.inspect("No treesitter parser found for filetype: " .. filetype), vim.log.levels.WARN)
          return
        end

        -- Try to get existing parser
        local parser_configs = require("nvim-treesitter.parsers")
        if not parser_configs[parser_name] then
          return -- Parser not available, skip silently
        end

        local parser_exists = pcall(vim.treesitter.get_parser, bufnr, parser_name)

        if not parser_exists then
          if vim.tbl_contains(already_installed, parser_name) then
            vim.notify("Parser for " .. parser_name .. " already installed.", vim.log.levels.INFO)
          else
            vim.notify("Installing parser for " .. parser_name, vim.log.levels.INFO)
            treesitter.install({ parser_name }):wait(300000) -- wait for 5 minutes
          end
        end

        pcall(vim.treesitter.start, bufnr, parser_name)

        -- Use regex based syntax-highlighting as fallback as some plugins might need it
        vim.bo[bufnr].syntax = "ON"

        -- Use treesitter for folds
        vim.wo.foldlevel = 99
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"

        -- Use treesitter for indentation
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
