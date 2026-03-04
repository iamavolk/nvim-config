return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            version = '2.*',
            -- for snipper writing purposes:
            build = (function()
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
            opts = {},
        },
    },

    opts = {
        keymap = {
            preset = 'default',

            ['<C-f>'] = { 'snippet_forward', 'fallback' },
            ['<C-b>'] = { 'snippet_backward', 'fallback' },

            ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },

            ['<C-q>'] = { 'hide_signature' },
            ['<C-m>'] = { 'show', 'show_documentation', 'fallback' },
            ['<C-h>'] = { 'hide_documentation', 'hide', 'fallback' },

            -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion):
            --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },

        appearance = {
            nerd_font_variant = 'mono',
        },

        completion = {
            menu = { border = 'solid' },

            documentation = {
                auto_show = false,
                auto_show_delay_ms = 500,
                window = { border = 'solid' },
                treesitter_highlighting = false,
            },
        },

        sources = {
            min_keyword_length = 3,
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        snippets = { preset = 'luasnip' },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true },
    },

    opts_extend = { "sources.default" },
}
-- vim: ts=4 sts=4 sw=4 et
