return {
    {
        "thesimonho/kanagawa-paper.nvim",
        -- lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("kanagawa-paper-ink")
            vim.api.nvim_set_hl(0, "@lsp.typemod.variable.mutable.rust", { fg = "#b6927b", bold = false })
            vim.api.nvim_set_hl(0, "@lsp.typemod.macro.library.rust", { fg = "#c4746e", bold = false })
            -- vim.api.nvim_set_hl(0, "@lsp.typemod.method.associated.rust", { fg = "#111111", bold = true })
            -- #859fac
            vim.api.nvim_set_hl(0, "@lsp.typemod.struct.library.rust", { fg = "#8ea49e" })
            vim.api.nvim_set_hl(0, "@lsp.typemod.method.associated.rust", { fg = "#859fac" })
        end,
        config = function()
            require("kanagawa-paper").setup({
                dim_inactive = true,
                cache = true,
            })
        end,
        -- opts = {
        --     dim_inactive = true,
        -- },
    },
}
