return {
    "folke/trouble.nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")

        local map = require("my-config.utils.mappings").map
        local mapping_options = { silent = true, noremap = true, }

        map("n", "gR", function() trouble.open("lsp_references") end, mapping_options, "Trouble toggle lsp references")
        map("n", "<leader>xx", function() trouble.open() end, mapping_options, "Trouble toggle")
        map("n", "<leader>xw", function() trouble.open("workspace_diagnostics") end, mapping_options,
            "Trouble toggle workspace diagnostics")
        map("n", "<leader>xd", function() trouble.open("document_diagnostics") end, mapping_options,
            "Trouble toggle document diagnostics")
        map("n", "<leader>xq", function() trouble.open("quickfix") end, mapping_options, "Trouble toggle quickfix list")
        map("n", "<leader>xl", function() trouble.open("loclist") end, mapping_options, "Trouble toggle loclist")
    end,
}
