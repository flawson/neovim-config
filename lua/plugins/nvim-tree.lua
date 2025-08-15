return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local nt_api = require('nvim-tree.api')
        require('nvim-tree').setup({
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            git = {
                enable = true,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                    glyphs = {
                        git = {
                            unstaged = 'US',
                            staged = 'S',
                            unmerged = 'UM',
                            renamed = 'R',
                            deleted = 'D',
                            untracked = 'U',
                        },
                    },
                },
            },
            on_attach = function(bufnr)
                -- local function to populate default keymap config values from nvim-tree.keymap
                local keymap_opts = function(desc)
                    return {desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
                end

                -- Filesystem operations
                vim.keymap.set('n', 'c',     nt_api.fs.copy.node,                    keymap_opts('copy file'))
                vim.keymap.set('n', 'y',     nt_api.fs.copy.absolute_path,           keymap_opts('copy absolute filepath'))
                vim.keymap.set('n', 'a',     nt_api.fs.create,                       keymap_opts('create file or directory'))
                vim.keymap.set('n', 'x',     nt_api.fs.cut,                          keymap_opts('cut file'))
                vim.keymap.set('n', 'v',     nt_api.fs.paste,                        keymap_opts('paste file'))
                vim.keymap.set('n', 'd',     nt_api.fs.remove,                       keymap_opts('file/folder delete'))
                vim.keymap.set('n', 'r',     nt_api.fs.rename_basename,              keymap_opts('Rename: Basename'))
                vim.keymap.set('n', '<C-r>', nt_api.fs.rename_full,                  keymap_opts('Rename: Full Path'))
                vim.keymap.set('n', 'D',     nt_api.fs.trash,                        keymap_opts('Trash'))
                --
                -- Highlighted file operations
                vim.keymap.set('n', ']d',    nt_api.node.navigate.diagnostics.next,  keymap_opts('Next Diagnostic'))
                vim.keymap.set('n', '[d',    nt_api.node.navigate.diagnostics.prev,  keymap_opts('Prev Diagnostic'))
                vim.keymap.set('n', ']g',    nt_api.node.navigate.git.next,          keymap_opts('Next Git'))
                vim.keymap.set('n', '[g',    nt_api.node.navigate.git.prev,          keymap_opts('Prev Git'))
                vim.keymap.set('n', 'P',     nt_api.node.navigate.parent,            keymap_opts('Parent Directory'))
                vim.keymap.set('n', '<BS>',  nt_api.node.navigate.parent_close,      keymap_opts('Close Directory'))
                vim.keymap.set('n', '<CR>',  nt_api.node.open.edit,                  keymap_opts('open file/expand directory'))
                vim.keymap.set('n', 'S',     nt_api.node.open.horizontal,            keymap_opts('Open: Horizontal Split'))
                vim.keymap.set('n', 'O',     nt_api.node.open.no_window_picker,      keymap_opts('Open: No Window Picker'))
                vim.keymap.set('n', '<Tab>', nt_api.node.open.preview,               keymap_opts('Open Preview'))
                vim.keymap.set('n', '<C-e>', nt_api.node.open.replace_tree_buffer,   keymap_opts('Open: In Place'))
                vim.keymap.set('n', 'L',     nt_api.node.open.toggle_group_empty,    keymap_opts('Toggle Group Empty'))
                vim.keymap.set('n', '<C-k>', nt_api.node.show_info_popup,            keymap_opts('Info'))
                vim.keymap.set('n', 'V',     nt_api.node.open.vertical,              keymap_opts('Open: Vertical Split'))
                --
                -- Tree appearance and expansion/collapsing
                vim.keymap.set('n', '>',     nt_api.tree.change_root_to_node,        keymap_opts('set current directory'))
                vim.keymap.set('n', '<',     nt_api.tree.change_root_to_parent,      keymap_opts('set parent directory'))
                vim.keymap.set('n', 'q',     nt_api.tree.close,                      keymap_opts('Close'))
                vim.keymap.set('n', 'W',     nt_api.tree.collapse_all,               keymap_opts('Collapse All'))
                vim.keymap.set('n', 'E',     nt_api.tree.expand_all,                 keymap_opts('Expand All'))
                vim.keymap.set('n', 'R',     nt_api.tree.reload,                     keymap_opts('Refresh'))
                vim.keymap.set('n', 'U',     nt_api.tree.toggle_custom_filter,       keymap_opts('Toggle Filter: Hidden'))
                vim.keymap.set('n', 'C',     nt_api.tree.toggle_git_clean_filter,    keymap_opts('Toggle Filter: Git Clean'))
                vim.keymap.set('n', 'I',     nt_api.tree.toggle_gitignore_filter,    keymap_opts('Toggle Filter: Git Ignore'))
                vim.keymap.set('n', 'g?',    nt_api.tree.toggle_help,                keymap_opts('Help'))
                vim.keymap.set('n', 'H',     nt_api.tree.toggle_hidden_filter,       keymap_opts('Toggle Filter: Dotfiles'))
                vim.keymap.set('n', 'M',     nt_api.tree.toggle_no_bookmark_filter,  keymap_opts('Toggle Filter: No Bookmark'))
                vim.keymap.set('n', 'B',     nt_api.tree.toggle_no_buffer_filter,    keymap_opts('Toggle Filter: No Buffer'))
                --
                -- File marks
                vim.keymap.set('n', 'bd',    nt_api.marks.bulk.delete,               keymap_opts('Delete Bookmarked'))
                vim.keymap.set('n', 'bmv',   nt_api.marks.bulk.move,                 keymap_opts('Move Bookmarked'))
                vim.keymap.set('n', 'bt',    nt_api.marks.bulk.trash,                keymap_opts('Trash Bookmarked'))
                vim.keymap.set('n', 'm',     nt_api.marks.toggle,                    keymap_opts('Toggle Bookmark'))
            end
        })
    end,
}

