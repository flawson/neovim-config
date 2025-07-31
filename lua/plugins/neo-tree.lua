--local function change_directory(opts)
--    local fs = require('neo-tree.sources.filesystem.commands')
--
--    local path = opts.args or '.'
--    local tab_page = vim.api.nvim_get_current_tabpage()
--    local state = fs.get_state(tab_page)
--    fs.navigate(state, path, path, nil, nil)
--end

return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('neo-tree').setup({
            log_level = 'info',
            filesystem = {

            },
            window = {
                -- replace <space> with <cr> for opening subdirs
                ['<space>'] = {},
                ['<cr>'] = {
                    'toggle_node',
                },
                -- replace <C-f> with <C-n> for scrolling forwards
                ['<C-f>'] = {},
                ['<C-n>'] = {
                    'scroll_preview',
                    config = {
                        direction = -10,
                    },
                },
                -- replace <C-b> with <C-p> for scrolling backwards
                ['<C-b>'] = {},
                ['<C-p>'] = {
                    'scroll_preview',
                    config = {
                        direction = 10,
                    },
                },
            }
        })
        vim.keymap.set(
            'n',
            '<leader>fe',
            function()
                vim.cmd('Neotree')
            end,
            { desc = '[f]ile [e]xplorer (Neotree)' }
        )
        --vim.api.nvim_create_user_command(
        --    'NeotreeChangeDir',
        --    change_directory,
        --    {
        --        nargs = '?',
        --        desc = 'change to specified directory',
        --    }
        --)
    end
}
