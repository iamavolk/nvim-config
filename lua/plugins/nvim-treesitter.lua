return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local ftypes = { 'c', 'diff', 'lua', 'luadoc',  'markdown',
                         'markdown_inline', 'query', 'vim', 'python',
                         'rust'}

        require('nvim-treesitter').install(ftypes)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = ftypes,
            callback = function() vim.treesitter.start() end,
        })
    end,
}
-- vim: ts=4 sts=4 sw=4 et
