return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup({
--            diagnostics = {
--                enable = true,
--                show_on_dirs = true,
--                show_on_open_dirs = true,
--            }
        })
    end,
}

