local module_name = 'plugins.v1'
local specs = module_name .. '.' .. 'specs'

-- Local modules to import
local modules = {
    'lsp-config',
    'remaps'
}

-- Setup lazy.nvim
require('lazy').setup({
    spec = {
        -- import your plugins
        { import = specs },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'habamax' } },
    -- flag to automatically check for plugin updates
    --
    -- i'm stubborn... if i really need an update for something i should seek it out myself
    checker = { enabled = false },
})

-- Module load
for _, module in ipairs(modules) do
    require(module_name .. '.' .. module)
end

