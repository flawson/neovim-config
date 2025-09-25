-- imports


-- general
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>t', function() vim.cmd('botright split | resize 12 | terminal') end, {desc = 'open [t]erminal'})

-- diagnostics
--vim.keymap.set('n', '<leader>ld', diag_report, {desc = '[l]ist [d]iagnostics'})
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, {desc = '[d]iagnostics [l]ist'})
--vim.keymap.set('n', '<leader>dn', vim.diagnostic.setloclist, {desc = '[d]iagnostics [n]ext'})
--vim.keymap.set('n', '<leader>dp', vim.diagnostic.setloclist, {desc = '[d]iagnostics [p]revious'})

-- window movement
vim.keymap.set('n', '<leader>wh', '<C-w>h', {desc = 'switch window left'})
vim.keymap.set('n', '<leader>wH', '<C-w>H', {desc = 'move window left'})
vim.keymap.set('n', '<leader>wj', '<C-w>j', {desc = 'switch window down'})
vim.keymap.set('n', '<leader>wJ', '<C-w>J', {desc = 'move window down'})
vim.keymap.set('n', '<leader>wk', '<C-w>k', {desc = 'switch window up'})
vim.keymap.set('n', '<leader>wK', '<C-w>K', {desc = 'move window up'})
vim.keymap.set('n', '<leader>wl', '<C-w>l', {desc = 'switch window right'})
vim.keymap.set('n', '<leader>wL', '<C-w>L', {desc = 'move window right'})
vim.keymap.set('n', '<leader>wv', '<C-w>v', {desc = 'split window vertically'})
vim.keymap.set('n', '<leader>ws', '<C-w>s', {desc = 'split window horizontally'})
vim.keymap.set('n', '<leader>w=', '<C-w>=', {desc = 'resize windows equally'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {desc = 'exit terminal mode'})

