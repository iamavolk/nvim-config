return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
        require("marks").setup({
            refresh_interval = 350,
        })
        vim.api.nvim_set_hl(0, "MarkSignHL", { fg = "#cc5555" })
        vim.keymap.set('n', '<A-m>', require('marks').delete_line)
    end,
}
-- vim: ts=4 sts=4 sw=4 et
