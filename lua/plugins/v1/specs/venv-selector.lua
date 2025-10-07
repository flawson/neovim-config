return {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {'<leader>vs', '<cmd>VenvSelect<cr>'},
    },
    ft = 'python',
    name = 'venv-selector',
    config = function()
        require('venv-selector').setup({})
    end,
}
