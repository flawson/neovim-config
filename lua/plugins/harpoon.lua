return (
    {
        'theprimeagen/harpoon',
        config = function()
            require('harpoon').setup()

            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>ha', mark.add_file)
            vim.keymap.set('n', '<leader>hr', mark.rm_file)
            vim.keymap.set('n', '<leader>hc', mark.clear_all)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
            vim.keymap.set('n', '<C-j>', ui.nav_next)
            vim.keymap.set('n', '<C-k>', ui.nav_prev)

        end
    }
)
