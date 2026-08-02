return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ", -- Fills the circle
                    [vim.diagnostic.severity.WARN] = " ", -- Standard bold warning
                    [vim.diagnostic.severity.INFO] = " ", -- Solid Info
                    [vim.diagnostic.severity.HINT] = "󰌵 ", -- Glowing lightbulb
                },
            } or {},
        })

        vim.lsp.enable("lua_ls")
        vim.lsp.enable("ty")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("clangd")
    end,
}
