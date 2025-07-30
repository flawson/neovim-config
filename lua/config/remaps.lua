vim.keymap.set('n', '<leader>pd', vim.cmd.Ex, { desc = 'Go To [P]arent [D]irectory' })
vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float(nil, {focus=false}) end)

vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
