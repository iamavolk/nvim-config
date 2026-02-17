return {
    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        opts = {
            delay = 1000,
            icons = {
                -- if Nerd Font is installed, set mappings = true, and keys = {} 
                -- otherwise define keys
                mappings = true,
                keys = {},
            },

            spec = {
                { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
                { '<leader>d', group = '[D]ocument' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>w', group = '[W]orkspace' },
                { '<leader>t', group = '[T]oggle' },
                { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
            },
        },
    },
}
-- vim: ts=4 sts=4 sw=4 et
