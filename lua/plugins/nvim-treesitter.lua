return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ftypes = {
            "c", "diff", "lua", "luadoc",
            "hcl", "cpp", "javascript",
            "java", "pug", "systemverilog",
            "markdown", "markdown_inline",
            "query", "vim", "python", "rust",
            "terraform", "typescript", "typst",
            "dockerfile",
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
