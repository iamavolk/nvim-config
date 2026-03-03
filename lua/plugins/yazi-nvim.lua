return {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
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

    config = function()
        require('yazi').setup({
            keymaps = {
                show_help = '<C-h><C-h>',
                copy_relative_path_to_selected_files = false,
            },
            highlight_hovered_buffers_in_same_directory = false,
            yazi_floating_window_border = 'bold',
            floating_window_scaling_factor = 0.90,
        })
    end,
}
-- vim: ts=4 sts=4 sw=4 et
