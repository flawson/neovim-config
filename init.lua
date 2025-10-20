-- Global settings
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins
require('plugins')

-- Load non-global, non-plugin-based settings
require('user_cfg')

