-- LSP Setup calls (if needed for given LSP)
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            completeUnimported = true,
        },
    },
})

require('lspconfig').lua_ls.setup({
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc')) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend(
            'force',
            client.config.settings.Lua,
            {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        )
    end,
    settings = {
        Lua = {},
    },
})
-- LSP Setup calls - end

-- LSP Enables
-- Ansible
vim.lsp.enable('ansiblels')
-- Bash
vim.lsp.enable('bashls')
-- Clang
vim.lsp.enable('clangd')
-- CMake
vim.lsp.enable('cmake')
-- Docker Compose
vim.lsp.enable('docker_compose_language_service')
-- Docker
vim.lsp.enable('dockerls')
-- Sphinx Docs
vim.lsp.enable('esbonio')
-- gopls
vim.lsp.enable('gopls')
-- gradle
vim.lsp.enable('gradle_ls')
-- html
vim.lsp.enable('html')
-- htmx
vim.lsp.enable('htmx')
-- Javascript/Typescript (including jsx/tsx)
vim.lsp.enable('ts_ls')
-- jinja
vim.lsp.enable('jinja_lsp')
-- JSON
vim.lsp.enable('jsonls')
-- lua
vim.lsp.enable('lua_ls')
-- Markdown
vim.lsp.enable('marksman')
-- Nginx
vim.lsp.enable('nginx_language_server')
-- Perl
vim.lsp.enable('perlls')
-- Python
vim.lsp.enable('pyright')
-- Ruby
vim.lsp.enable('ruby_lsp')
-- Rust
vim.lsp.enable('rust_analyzer')
-- Terraform
vim.lsp.enable('terraformls')
-- Yaml
vim.lsp.enable('yamlls')
-- LSP Enables - end

