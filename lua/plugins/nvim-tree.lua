return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
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
        })
    end,
}

