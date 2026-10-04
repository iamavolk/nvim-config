return {
    -- on_attach = function(client, bufnr)
    --     client.server_capabilities.semanticTokensProvider = nil
    -- end,
    cmd = { "verible-verilog-ls" },
    filetypes = { "systemverilog" },
    root_markers = { "Makefile", ".git" },
}
