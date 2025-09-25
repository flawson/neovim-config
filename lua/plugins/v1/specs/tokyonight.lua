return (
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            require('tokyonight').setup {
                transparent = true,
                on_highlights = function(highlights, colors)
                    highlights.LineNr = {
                        fg = "#3a89b8",
                    }
                    --highlights["@keyword.function"] = {
                    --    fg = "#7ac5f7",
                    --}
                end
            }
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    }
)

