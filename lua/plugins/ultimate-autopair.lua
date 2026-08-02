return {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes

    opts = {
        { "$", "$", fly = true, dosuround = true, newline = false, space = true, ft = { "markdown", "typst" } },
        { "$$", "$$", fly = true, dosuround = true, newline = true, space = true, ft = { "markdown" } },
        { "_", "_", fly = false, dosuround = true, newline = false, space = true, ft = { "markdown" } },
        { "**", "**", fly = true, dosuround = true, newline = false, space = true, ft = { "markdown" } },
        { "<", ">", fly = true, dosuround = true, newline = true, space = true, ft = { "markdown" } },
        { "'", "'", fly=true, dosuround = true, newline = false, space = false, ft = { "rust" } },

        fastwarp = { map = "<A-f>", rmap = "<A-b>" },
        bs = { map = { "<BS>", "<C-h>" } },
        cr = { map = "<C-m>" },
        close = { map = "<A-a>" },
        -- tabout = { enable = true, map = '<C-e>', hopout = true },
    },
}
-- vim: ts=4 sts=4 sw=4 et
