return {
    -- lazy = true,
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    -- opts = {
    --     heading = {
    --         enabled = true,
    --     },
    -- },
    config = function()
        require('render-markdown').setup({
            code = {
                language = false,
                width = 'block',
                left_margin = 0.5,
                left_pad = 0.2,
                right_pad = 0.2,
            },
            anti_conceal = { enabled = false },
        })
    end,
}
