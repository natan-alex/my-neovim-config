return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local harpoon_extensions = require("harpoon.extensions")

    harpoon:setup()

    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

    harpoon:extend({
      UI_CREATE = function(cx)
        local options = { buffer = cx.bufnr }

        vim.keymap.set("n", "o", function()
          harpoon.ui:select_menu_item()
        end, options)

        vim.keymap.set("n", ">", function()
          harpoon.ui:select_menu_item()
        end, options)

        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, options)

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, options)

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, options)
      end,
    })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>lp", function()
      harpoon:list():prev()
    end)

    vim.keymap.set("n", "<leader>ln", function()
      harpoon:list():next()
    end)
  end
}
