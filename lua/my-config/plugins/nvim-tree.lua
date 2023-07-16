local nvim_tree = require("nvim-tree")

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    sort_by = "name",
    disable_netrw = true,
    hijack_cursor = true,
    modified = {
        enable = true,
        show_on_dirs = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    renderer = {
        highlight_opened_files = "all",
        indent_markers = {
            enable = true,
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    actions = {
        open_file = {
            quit_on_open = true
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        adaptive_size = true,
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function options(description)
                return {
                    desc = "nvim-tree: " .. description,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- BEGIN_DEFAULT_ON_ATTACH
            vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, options("CD"))
            vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, options("Open: In Place"))
            vim.keymap.set("n", "<C-k>", api.node.show_info_popup, options("Info"))
            vim.keymap.set("n", "<C-r>", api.fs.rename_sub, options("Rename: Omit Filename"))
            vim.keymap.set("n", "<C-t>", api.node.open.tab, options("Open: New Tab"))
            vim.keymap.set("n", "<C-v>", api.node.open.vertical, options("Open: Vertical Split"))
            vim.keymap.set("n", "<C-x>", api.node.open.horizontal, options("Open: Horizontal Split"))
            vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, options("Close Directory"))
            vim.keymap.set("n", "<CR>", api.node.open.edit, options("Open"))
            vim.keymap.set("n", "<Tab>", api.node.open.preview, options("Open Preview"))
            vim.keymap.set("n", ">", api.node.navigate.sibling.next, options("Next Sibling"))
            vim.keymap.set("n", "<", api.node.navigate.sibling.prev, options("Previous Sibling"))
            vim.keymap.set("n", ".", api.node.run.cmd, options("Run Command"))
            vim.keymap.set("n", "-", api.tree.change_root_to_parent, options("Up"))
            vim.keymap.set("n", "a", api.fs.create, options("Create"))
            vim.keymap.set("n", "bd", api.marks.bulk.delete, options("Delete Bookmarked"))
            vim.keymap.set("n", "bmv", api.marks.bulk.move, options("Move Bookmarked"))
            vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, options("Toggle Filter: No Buffer"))
            vim.keymap.set("n", "c", api.fs.copy.node, options("Copy"))
            vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, options("Toggle Filter: Git Clean"))
            vim.keymap.set("n", "[c", api.node.navigate.git.prev, options("Prev Git"))
            vim.keymap.set("n", "]c", api.node.navigate.git.next, options("Next Git"))
            vim.keymap.set("n", "d", api.fs.remove, options("Delete"))
            vim.keymap.set("n", "D", api.fs.trash, options("Trash"))
            vim.keymap.set("n", "E", api.tree.expand_all, options("Expand All"))
            vim.keymap.set("n", "e", api.fs.rename_basename, options("Rename: Basename"))
            vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, options("Next Diagnostic"))
            vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, options("Prev Diagnostic"))
            vim.keymap.set("n", "F", api.live_filter.clear, options("Clean Filter"))
            vim.keymap.set("n", "f", api.live_filter.start, options("Filter"))
            vim.keymap.set("n", "g?", api.tree.toggle_help, options("Help"))
            vim.keymap.set("n", "gy", api.fs.copy.absolute_path, options("Copy Absolute Path"))
            vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, options("Toggle Filter: Dotfiles"))
            vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, options("Toggle Filter: Git Ignore"))
            vim.keymap.set("n", "J", api.node.navigate.sibling.last, options("Last Sibling"))
            vim.keymap.set("n", "K", api.node.navigate.sibling.first, options("First Sibling"))
            vim.keymap.set("n", "m", api.marks.toggle, options("Toggle Bookmark"))
            vim.keymap.set("n", "o", api.node.open.edit, options("Open"))
            vim.keymap.set("n", "O", api.node.open.no_window_picker, options("Open: No Window Picker"))
            vim.keymap.set("n", "p", api.fs.paste, options("Paste"))
            vim.keymap.set("n", "P", api.node.navigate.parent, options("Parent Directory"))
            vim.keymap.set("n", "q", api.tree.close, options("Close"))
            vim.keymap.set("n", "r", api.fs.rename, options("Rename"))
            vim.keymap.set("n", "R", api.tree.reload, options("Refresh"))
            vim.keymap.set("n", "s", api.node.run.system, options("Run System"))
            vim.keymap.set("n", "S", api.tree.search_node, options("Search"))
            vim.keymap.set("n", "U", api.tree.toggle_custom_filter, options("Toggle Filter: Hidden"))
            vim.keymap.set("n", "W", api.tree.collapse_all, options("Collapse"))
            vim.keymap.set("n", "x", api.fs.cut, options("Cut"))
            vim.keymap.set("n", "y", api.fs.copy.filename, options("Copy Name"))
            vim.keymap.set("n", "Y", api.fs.copy.relative_path, options("Copy Relative Path"))
            vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, options("Open"))
            vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, options("CD"))
            -- END_DEFAULT_ON_ATTACH

            vim.keymap.set("n", "u", api.tree.change_root_to_parent, options("Up"))
            vim.keymap.set("n", "t", api.node.open.tab, options("Open: New Tab"))
            vim.keymap.set("n", "C", api.tree.change_root_to_node, options("CD"))
            vim.keymap.set("n", "s", api.node.open.horizontal, options("Open: Horizontal Split"))
            vim.keymap.set("n", "v", api.node.open.vertical, options("Open: Vertical Split"))
        end
    },
})

local map = require("my-config.utils.mappings").map
local mapping_options = { silent = true, noremap = true, nowait = true }

map("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", mapping_options, "NvimTree toggle")
