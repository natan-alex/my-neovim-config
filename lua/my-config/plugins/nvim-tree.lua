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
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local map = require("my-config.utils.mappings").map
        local mapping_options = { noremap = true, silent = true, nowait = true, buffer = bufnr }

        local function create_description(description)
            return "nvim-tree: " .. description
        end

        -- BEGIN_DEFAULT_ON_ATTACH
        map("n", "<C-]>", api.tree.change_root_to_node, mapping_options, create_description("CD"))
        map("n", "<C-e>", api.node.open.replace_tree_buffer, mapping_options, create_description("Open: In Place"))
        map("n", "<C-k>", api.node.show_info_popup, mapping_options, create_description("Info"))
        map("n", "<C-r>", api.fs.rename_sub, mapping_options, create_description("Rename: Omit Filename"))
        map("n", "<C-t>", api.node.open.tab, mapping_options, create_description("Open: New Tab"))
        map("n", "<C-v>", api.node.open.vertical, mapping_options, create_description("Open: Vertical Split"))
        map("n", "<C-x>", api.node.open.horizontal, mapping_options, create_description("Open: Horizontal Split"))
        map("n", "<BS>", api.node.navigate.parent_close, mapping_options, create_description("Close Directory"))
        map("n", "<CR>", api.node.open.edit, mapping_options, create_description("Open"))
        map("n", "<Tab>", api.node.open.preview, mapping_options, create_description("Open Preview"))
        map("n", ">", api.node.navigate.sibling.next, mapping_options, create_description("Next Sibling"))
        map("n", "<", api.node.navigate.sibling.prev, mapping_options, create_description("Previous Sibling"))
        map("n", ".", api.node.run.cmd, mapping_options, create_description("Run Command"))
        map("n", "-", api.tree.change_root_to_parent, mapping_options, create_description("Up"))
        map("n", "a", api.fs.create, mapping_options, create_description("Create"))
        map("n", "bd", api.marks.bulk.delete, mapping_options, create_description("Delete Bookmarked"))
        map("n", "bmv", api.marks.bulk.move, mapping_options, create_description("Move Bookmarked"))
        map("n", "B", api.tree.toggle_no_buffer_filter, mapping_options, create_description("Toggle Filter: No Buffer"))
        map("n", "c", api.fs.copy.node, mapping_options, create_description("Copy"))
        map("n", "C", api.tree.toggle_git_clean_filter, mapping_options, create_description("Toggle Filter: Git Clean"))
        map("n", "[c", api.node.navigate.git.prev, mapping_options, create_description("Prev Git"))
        map("n", "]c", api.node.navigate.git.next, mapping_options, create_description("Next Git"))
        map("n", "d", api.fs.remove, mapping_options, create_description("Delete"))
        map("n", "D", api.fs.trash, mapping_options, create_description("Trash"))
        map("n", "E", api.tree.expand_all, mapping_options, create_description("Expand All"))
        map("n", "e", api.fs.rename_basename, mapping_options, create_description("Rename: Basename"))
        map("n", "]e", api.node.navigate.diagnostics.next, mapping_options, create_description("Next Diagnostic"))
        map("n", "[e", api.node.navigate.diagnostics.prev, mapping_options, create_description("Prev Diagnostic"))
        map("n", "F", api.live_filter.clear, mapping_options, create_description("Clean Filter"))
        map("n", "f", api.live_filter.start, mapping_options, create_description("Filter"))
        map("n", "g?", api.tree.toggle_help, mapping_options, create_description("Help"))
        map("n", "gy", api.fs.copy.absolute_path, mapping_options, create_description("Copy Absolute Path"))
        map("n", "H", api.tree.toggle_hidden_filter, mapping_options, create_description("Toggle Filter: Dotfiles"))
        map("n", "I", api.tree.toggle_gitignore_filter, mapping_options, create_description("Toggle Filter: Git Ignore"))
        map("n", "J", api.node.navigate.sibling.last, mapping_options, create_description("Last Sibling"))
        map("n", "K", api.node.navigate.sibling.first, mapping_options, create_description("First Sibling"))
        map("n", "m", api.marks.toggle, mapping_options, create_description("Toggle Bookmark"))
        map("n", "o", api.node.open.edit, mapping_options, create_description("Open"))
        map("n", "O", api.node.open.no_window_picker, mapping_options, create_description("Open: No Window Picker"))
        map("n", "p", api.fs.paste, mapping_options, create_description("Paste"))
        map("n", "P", api.node.navigate.parent, mapping_options, create_description("Parent Directory"))
        map("n", "q", api.tree.close, mapping_options, create_description("Close"))
        map("n", "r", api.fs.rename, mapping_options, create_description("Rename"))
        map("n", "R", api.tree.reload, mapping_options, create_description("Refresh"))
        map("n", "s", api.node.run.system, mapping_options, create_description("Run System"))
        map("n", "S", api.tree.search_node, mapping_options, create_description("Search"))
        map("n", "U", api.tree.toggle_custom_filter, mapping_options, create_description("Toggle Filter: Hidden"))
        map("n", "W", api.tree.collapse_all, mapping_options, create_description("Collapse"))
        map("n", "x", api.fs.cut, mapping_options, create_description("Cut"))
        map("n", "y", api.fs.copy.filename, mapping_options, create_description("Copy Name"))
        map("n", "Y", api.fs.copy.relative_path, mapping_options, create_description("Copy Relative Path"))
        map("n", "<2-LeftMouse>", api.node.open.edit, mapping_options, create_description("Open"))
        map("n", "<2-RightMouse>", api.tree.change_root_to_node, mapping_options, create_description("CD"))
        -- END_DEFAULT_ON_ATTACH

        map("n", "u", api.tree.change_root_to_parent, mapping_options, create_description("Up"))
        map("n", "t", api.node.open.tab, mapping_options, create_description("Open: New Tab"))
        map("n", "C", api.tree.change_root_to_node, mapping_options, create_description("CD"))
        map("n", "s", api.node.open.horizontal, mapping_options, create_description("Open: Horizontal Split"))
        map("n", "v", api.node.open.vertical, mapping_options, create_description("Open: Vertical Split"))
    end
})
