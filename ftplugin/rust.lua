local was_which_key_module_found, which_key = pcall(require, "which-key")

if not was_which_key_module_found then return end

local common = require("neovim.ftplugins-common")

local mappings = {
    p = {
        r = { common.execute_on_toggleterm("cargo run"), "Run project" },
        b = { common.execute_on_toggleterm("cargo build"), "Build project" },
        w = { common.execute_on_toggleterm("cargo watch -x run"), "Watch project" },
    },
}

which_key.register(mappings, common.which_key_mapping_options)
