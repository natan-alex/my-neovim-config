return {
	"pmizio/typescript-tools.nvim",
    enabled = false,
    ft = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "astro",
        "glimmer",
        "handlebars",
        "hbs",
    },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
            settings = {
                expose_as_code_action = "all",
                tsserver_plugins = {
                    "@styled/typescript-styled-plugin",
                }
            }
        })
	end,
}
