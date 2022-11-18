local telescope_found, telescope = pcall(require, "telescope")

if not telescope_found then
    vim.notify("telescope module not found. Error: " .. telescope, "error")
    return
end

telescope.load_extension("neoclip")

local neoclip_found, neoclip = pcall(require, "neoclip")

if not neoclip_found then
    vim.notify("neoclip module not found. Error: " .. neoclip, "error")
    return
end

neoclip.setup()
