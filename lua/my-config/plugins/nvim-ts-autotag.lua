return {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
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
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
