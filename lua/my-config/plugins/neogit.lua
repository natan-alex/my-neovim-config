local neogit = require("neogit")

neogit.setup({
    disable_signs = true,
    use_telescope = true,
    integrations = {
        diffview = true
    },
})
