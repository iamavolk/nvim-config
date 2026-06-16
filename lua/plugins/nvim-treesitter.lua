return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ftypes = {
            "c",
            "cpp",
            "diff",
            "dockerfile",
            "hcl",
            "java",
            "javascript",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "pug",
            "python",
            "query",
            "rust",
            "systemverilog",
            "terraform",
            "typescript",
            "typst",
            "vim",
        }

        require("nvim-treesitter").install(ftypes)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = ftypes,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
-- vim: ts=4 sts=4 sw=4 et
