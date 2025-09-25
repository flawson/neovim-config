-- plugin imports
-- local hmark = require('harpoon.mark')
-- local hui = require('harpoon.ui')
local tele_builtin = require('telescope.builtin')
-- imports - end

-- helper functions
-- helper functions - end


-- harpoon
-- vim.keymap.set('n', '<leader>ha', hmark.add_file, {desc='[h]arpoon [a]dd file'})
-- vim.keymap.set('n', '<leader>hr', hmark.rm_file, {desc = '[h]arpoon [r]emove file'})
-- vim.keymap.set('n', '<leader>hc', hmark.clear_all, {desc = '[h]arpoon [c]lear list'})
-- vim.keymap.set('n', '<leader>hs', hui.toggle_quick_menu, {desc = '[h]arpoon [s]how'})
-- vim.keymap.set('n', '<leader>hj', hui.nav_next, {desc = '[h]arpoon nav next [j]'})
-- vim.keymap.set('n', '<leader>hk', hui.nav_prev, {desc = '[h]arpoon nav prev [k]'})

-- nvim-tree
-- Keymaps (besides open) are stored within the nvim-tree.lua plugin spec
-- specifically to handle the on_attach for the file tree
vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeOpen, { desc = '[f]ile [e]xplorer' })

-- telescope
vim.keymap.set('n', '<leader>ff', tele_builtin.find_files, { desc = 'Telescope [f]ind [f]iles' })
vim.keymap.set('n', '<leader>fg', tele_builtin.live_grep, { desc = 'Telescope [f]ind live [g]rep' })
vim.keymap.set('n', '<leader>fp', tele_builtin.git_files, { desc = 'Telescope [f]ind in [p]roject' })
vim.keymap.set('n', '<leader>fm', tele_builtin.keymaps, { desc = 'Telescope [f]ind key[m]aps' })
vim.keymap.set('n', '<leader>fb', tele_builtin.buffers, { desc = 'Telescope [f]ind in [b]uffers' })
vim.keymap.set('n', '<leader>fh', tele_builtin.help_tags, { desc = 'Telescope [f]ind [h]elp tags' })
vim.keymap.set('n', '<leader>fr', tele_builtin.registers, { desc = 'Telescope [f]ind [r]egister' })

