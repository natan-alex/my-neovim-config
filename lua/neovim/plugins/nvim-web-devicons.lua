local was_module_found, nvim_web_devicons = pcall(require, "nvim-web-devicons")

if not was_module_found then
    return
end

nvim_web_devicons.setup()
