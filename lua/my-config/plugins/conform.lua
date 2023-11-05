return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<C-I>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- To run multiple formatters sequentially:
				-- python = { "isort", "black" }

				-- To run only the first available formatter:
				-- python = { { "isort", "black" } }

				html = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				javascript = { { "biome", "prettierd", "prettier" } },
				typescript = { { "biome", "prettierd", "prettier" } },
				javascriptreact = { { "biome", "prettierd", "prettier" } },
				typescriptreact = { { "biome", "prettierd", "prettier" } },
                csharp = { "csharpier" },
                python = { { "autopep8", "black" } },
			},
		})
	end,
}
