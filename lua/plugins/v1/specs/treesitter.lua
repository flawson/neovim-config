return (
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        config = function()
            require'nvim-treesitter.configs'.setup({
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = {
                    "c",
                    "go",
                    "javascript",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "typescript",
                    "vim",
                    "vimdoc",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    }
)
