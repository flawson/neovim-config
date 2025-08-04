return {
    'saghen/blink.cmp',
    dependencies = {'rafamadriz/friendly-snippets'},

    version = '1.*',
    opts = {
        appearance = {
            nerd_font_variant = 'normal',
        },
    },
    config = function()
        require('blink.cmp').setup({
            keymap = {
                ['<C-y>'] = {},
                ['<CR>'] = {'select_and_accept'},
            },
       })
    end,
}
