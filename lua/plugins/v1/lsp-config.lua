-- LSP Setup calls (if needed for given LSP)
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            completeUnimported = true,
        },
    },
})

require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        -- Set to "Replace" to get snippets instead of just function completion
        callSnippet = 'Replace',
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        -- Make the language server aware of Neovim's runtime files
        library = {
            vim.api.nvim_get_runtime_file("", true),
            "${3rd}/luv/library",
        }
      }
    }
  }
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

