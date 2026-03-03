return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        -- "saghen/blink.cmp",
    },
    config = function()

        vim.diagnostic.config {
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ', -- Fills the circle
                    [vim.diagnostic.severity.WARN]  = ' ', -- Standard bold warning
                    [vim.diagnostic.severity.INFO]  = ' ', -- Solid Info
                    [vim.diagnostic.severity.HINT]  = '󰌵 ', -- Glowing lightbulb
                },
            } or {},
        }

        vim.lsp.config('lua_ls', {

            on_init = function(client, init_result)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if path ~= vim.fn.stdpath("config") and
                        (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then return end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        path = { "lua/?.lua", "lua/?/init.lua" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        -- Pulls in all of runtime 
                        -- library = vim.api.nvim_get_runtime_file("", true),

                        -- library = {
                        --     vim.env.VIMRUNTIME,
                        --     '${3rd}/luv/library',
                        --     '${3rd}/busted/library',
                        -- }
                    },
                })
            end,

            --[[ TODO: extra capabilities might already be implemented in nvim core
            --   Hence, this might not be needed anymore
            --]]
            capabilities = vim.tbl_deep_extend( 'force',
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()),
                -- require("blink.cmp").get_lsp_capabilities()),
        })

        vim.lsp.enable('lua_ls')
        vim.lsp.enable('ty')
    end,
}
