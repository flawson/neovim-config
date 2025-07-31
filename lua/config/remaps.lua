-- helper functions

-- show diagnostic report for lsp reports
local function diag_report()
    vim.diagnostic.open_float(nil, {focus=false})
end
-- helper functions end

-- leader keymaps
--vim.keymap.set('n', '<leader>fe', file_explore, { desc = '[f]ile [e]xplorer' })
vim.keymap.set('n', '<leader>ld', diag_report, {desc = '[l]ist [d]iagnostics'})
vim.keymap.set('n', '<leader>t', function() vim.cmd('belowright terminal') end, {desc = 'open [t]erminal'})
-- leader keymaps end

-- edit keymaps
--vim.keymap.set('i', '(', '(<right>)')
--vim.keymap.set('i', '[', '[<right>]')
--vim.keymap.set('i', '{', '{<right>}')
-- edit keymaps end

