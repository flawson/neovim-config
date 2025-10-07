-- Set spaces instead of tabs
vim.o.expandtab = true

-- Disable mouse mode
vim.o.mouse = ''

-- Display line numbers
vim.o.number = true
vim.o.rnu = true

-- Set shiftwidth to match tabstop
vim.o.shiftwidth = 0

-- Set tabs to be 4 characters long
vim.o.tabstop = 4

-- Disable line wrap
vim.o.wrap = false

-- Need a ruler at 80, 100 for my sanity
vim.o.colorcolumn = '80,100'

-- color-code it to be something more obvious....
local set_ruler_color = function()
    vim.cmd('hi', {args={colorcolumn={ctermbg='lightgrey'}}})
end

