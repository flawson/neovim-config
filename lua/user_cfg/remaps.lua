-- imports

-- local functions
local open_window = function(direction)
    if direction == nil or direction == 'vertical' then
        vim.api.nvim_open_win(0, true, {split='right', win=0})
    elseif direction == 'horizontal' then
        vim.api.nvim_open_win(0, true, {split='below', win=0})
    end
end

-- general
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>s', function() vim.cmd('botright split | resize 12 | terminal') end, {desc = 'open [s]hell (terminal)'})

-- diagnostics
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, {desc = '[d]iagnostics [l]ist'})

-- window movement
vim.keymap.set('n', '<leader>wh', '<C-w>h', {desc = 'switch window left'})
vim.keymap.set('n', '<leader>wH', '<C-w>H', {desc = 'move window left'})
vim.keymap.set('n', '<leader>wj', '<C-w>j', {desc = 'switch window down'})
vim.keymap.set('n', '<leader>wJ', '<C-w>J', {desc = 'move window down'})
vim.keymap.set('n', '<leader>wk', '<C-w>k', {desc = 'switch window up'})
vim.keymap.set('n', '<leader>wK', '<C-w>K', {desc = 'move window up'})
vim.keymap.set('n', '<leader>wl', '<C-w>l', {desc = 'switch window right'})
vim.keymap.set('n', '<leader>wL', '<C-w>L', {desc = 'move window right'})
--vim.keymap.set('n', '<leader>wv', '<C-w>v', {desc = 'split window vertically'})
vim.keymap.set('n', '<leader>wv', function() open_window('vertical') end, {desc = 'split window vertically'})
--vim.keymap.set('n', '<leader>ws', '<C-w>s', {desc = 'split window horizontally'})
vim.keymap.set('n', '<leader>ws', function() open_window('horizontal') end, {desc = 'split window horizontally'})
vim.keymap.set('n', '<leader>w=', '<C-w>=', {desc = 'resize windows equally'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {desc = 'exit terminal mode'})
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, {desc = '[f]ile [e]xplorer'})

-- tabpages
vim.keymap.set('n', '<leader>tt', function() vim.cmd('tabnew') end, {desc = '[t]ab create [t]'})
vim.keymap.set('n', '<leader>tn', function() vim.cmd('tabn') end, {desc = '[t]ab [n]ext'})
vim.keymap.set('n', '<leader>tp', function() vim.cmd('tabp') end, {desc = '[t]ab [p]revious'})
vim.keymap.set('n', '<leader>tm', function() vim.cmd('tabm') end, {desc = '[t]ab [m]ove'})


