return {
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    cmd = { 'clangd', '--completion-style=detailed', '--header-insertion=iwyu' }
}
