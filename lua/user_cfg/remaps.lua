-- imports
local hmark = require('harpoon.mark')
local hui = require('harpoon.ui')
local tele_builtin = require('telescope.builtin')
-- imports - end

-- helper functions
-- helper functions - end

-- user keymaps

-- general
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeOpen, { desc = '[f]ile [e]xplorer' })
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

-- harpoon
vim.keymap.set('n', '<leader>ha', hmark.add_file, {desc='[h]arpoon [a]dd file'})
vim.keymap.set('n', '<leader>hr', hmark.rm_file, {desc = '[h]arpoon [r]emove file'})
vim.keymap.set('n', '<leader>hc', hmark.clear_all, {desc = '[h]arpoon [c]lear list'})
vim.keymap.set('n', '<leader>hs', hui.toggle_quick_menu, {desc = '[h]arpoon [s]how'})
vim.keymap.set('n', '<leader>hj', hui.nav_next, {desc = '[h]arpoon nav next [j]'})
vim.keymap.set('n', '<leader>hk', hui.nav_prev, {desc = '[h]arpoon nav prev [k]'})

-- nvim-tree
-- Keymaps are stored within the nvim-tree.lua plugin spec specifically to handle the
-- on_attach for the file tree

-- telescope
vim.keymap.set('n', '<leader>ff', tele_builtin.find_files, { desc = 'Telescope [f]ind [f]iles' })
vim.keymap.set('n', '<leader>fg', tele_builtin.live_grep, { desc = 'Telescope [f]ind live [g]rep' })
vim.keymap.set('n', '<leader>fp', tele_builtin.git_files, { desc = 'Telescope [f]ind in [p]roject' })
vim.keymap.set('n', '<leader>fm', tele_builtin.keymaps, { desc = 'Telescope [f]ind key[m]aps' })
vim.keymap.set('n', '<leader>fb', tele_builtin.buffers, { desc = 'Telescope [f]ind in [b]uffers' })
vim.keymap.set('n', '<leader>fh', tele_builtin.help_tags, { desc = 'Telescope [f]ind [h]elp tags' })
vim.keymap.set('n', '<leader>fr', tele_builtin.registers, { desc = 'Telescope [f]ind [r]egister' })

-- user keymaps - end

-- edit keymaps
--vim.keymap.set('i', '(', '(<right>)')
--vim.keymap.set('i', '[', '[<right>]')
--vim.keymap.set('i', '{', '{<right>}')

