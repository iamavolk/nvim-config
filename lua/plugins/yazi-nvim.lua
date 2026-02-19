return {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {{ "nvim-lua/plenary.nvim", lazy = true }},
    keys = {
        {
            "<leader>-",
            mode = { "n", "v" },
            "<cmd>Yazi<CR>",
            desc = "Open yazi at the current file",
        },
        {
            "<leader>cw",
            "<cmd>Yazi cwd<CR>",
            desc = "Open the file manager in nvim's working directory",
        },
        {
            "<leader><C-j>",
            "<cmd>Yazi toggle<CR>",
            desc = "Resume the last yazi session",
        },
    },
    ---@type YaziConfig | {}
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        yazi_floating_window_border = 'double',
        floating_window_scaling_factor = 0.95,
        open_for_directories = false,
        keymaps = {
            show_help = '<C-h><C-h>',
        },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
        -- mark netrw as loaded so it's not loaded at all.
        --
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        vim.g.loaded_netrwPlugin = 1
    end,
}
-- vim: ts=4 sts=4 sw=4 et
