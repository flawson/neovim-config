return (
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 
                'nvim-lua/plenary.nvim',
        },
        config = function()
            require('telescope').setup()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = 'Telescope find project' })
            vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Telescope find keymaps' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end,
	}
)
