-- terraform for new files, i have a feeling about loading order....
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.tf', '*.tfvars'},
    callback = function()
        vim.bo.filetype = 'terraform'
    end
})

