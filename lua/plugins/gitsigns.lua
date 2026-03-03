return {
    'lewis6991/gitsigns.nvim',
    -- opts = {
    --     signs = {
    --         add = { text = '+' },
    --         change = { text = '~' },
    --         delete = { text = '_' },
    --         topdelete = { text = '‾' },
    --         changedelete = { text = '~' },
    --     },
    -- },
    config = function ()
        local gitsigns = require('gitsigns')

        gitsigns.setup({

        })

        vim.keymap.set('n', ']g', function()
            ---@diagnostic disable-next-line: missing-fields
            gitsigns.nav_hunk('next', { preview = true, greedy = true })
        end, { desc = '' })

        vim.keymap.set('n', '[g', function()
            ---@diagnostic disable-next-line: missing-fields
            gitsigns.nav_hunk('prev', { preview = true })
        end, { desc = '' })

        vim.keymap.set('n', 'gp', function()
            gitsigns.preview_hunk()
        end, { desc = '' })

    end,
}
-- vim: ts=4 sts=4 sw=4 et
